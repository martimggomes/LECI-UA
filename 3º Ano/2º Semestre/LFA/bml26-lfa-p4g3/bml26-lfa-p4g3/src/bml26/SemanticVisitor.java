import java.util.HashMap;
import java.util.Map;

public class SemanticVisitor extends bml26BaseVisitor<String> {
    
    private Map<String, Symbol> symbolTable = new HashMap<>();
    
    public Map<String, Symbol> getSymbolTable() {
        return symbolTable;
    }
    
    private boolean hasErrors = false;

    public boolean hasErrors() {
        return hasErrors;
    }

    private void reportError(String message) {
        System.err.println("Erro Semântico: " + message);
        hasErrors = true;
    }

    @Override
    public String visitDeclaration(bml26Parser.DeclarationContext ctx) {
        String id = ctx.ID().getText();
        String declaredType = ctx.type().getText();
        boolean isConst = ctx.CONST() != null; 

        if (symbolTable.containsKey(id)) {
            reportError("O identificador '" + id + "' já foi declarado.");
            return null;
        }

        symbolTable.put(id, new Symbol(id, declaredType, isConst));

        if (ctx.expression() != null) {
            String exprType = visit(ctx.expression());
            if (declaredType.equals("string") && !exprType.equals("string")) {
                reportError("Incompatibilidade: Tentativa de atribuir um número à variável string '" + id + "'.");
            } else if (!declaredType.equals("string") && exprType != null && exprType.equals("string")) {
                reportError("Incompatibilidade: Tentativa de atribuir texto à variável numérica '" + id + "'.");
            }
        }
        return declaredType;
    }

    @Override
    public String visitAssignment(bml26Parser.AssignmentContext ctx) {
        String id = ctx.ID().getText();

        if (!symbolTable.containsKey(id)) {
            reportError("A variável '" + id + "' não está definida.");
            return null;
        }

        if (symbolTable.get(id).isConstant()) {
            reportError("Impossível reatribuir valor à constante '" + id + "'.");
            return null;
        }

        String varType = symbolTable.get(id).getType();
        String exprType = visit(ctx.expression());

        if (varType.equals("string") && !exprType.equals("string")) {
            reportError("Atribuição inválida: A variável '" + id + "' espera uma string.");
        } else if (!varType.equals("string") && exprType != null && exprType.equals("string")) {
            reportError("Atribuição inválida: A variável '" + id + "' espera um valor numérico.");
        }

        return varType;
    }

    @Override
    public String visitBitAssignment(bml26Parser.BitAssignmentContext ctx) {
        String id = ctx.ID().getText();
        if (!symbolTable.containsKey(id)) {
            reportError("A variável '" + id + "' não está definida.");
            return "error";
        }
        if (symbolTable.get(id).isConstant()) {
            reportError("Impossível modificar uma constante '" + id + "'.");
            return "error";
        }

        String idType = symbolTable.get(id).getType();
        String idxType = visit(ctx.expression(0));
        String valType = visit(ctx.expression(1));

        if (idType.startsWith("[")) {
            String content = idType.substring(1, idType.length() - 1);
            String baseType = content.split(";")[0].trim();

            if (baseType.equals("string") && !"string".equals(valType)) {
                reportError("Incompatibilidade de tipos: O array '" + id + "' é de elementos string, mas recebeu uma expressão numérica.");
                return "error";
            } else if (!baseType.equals("string") && "string".equals(valType)) {
                reportError("Incompatibilidade de tipos: O array '" + id + "' é numérico, mas recebeu uma expressão de texto.");
                return "error";
            }
            return baseType.equals("string") ? "string" : "number";
        } 
        else {
            if ("string".equals(valType)) {
                reportError("Atribuição de bit inválida: Não é permitido atribuir texto ao bit de um número '" + id + "'.");
                return "error";
            }
            return "number";
        }
    }

    @Override
    public String visitBitRangeAssignment(bml26Parser.BitRangeAssignmentContext ctx) {
        String id = ctx.ID().getText();
        if (!symbolTable.containsKey(id)) {
            reportError("A variável '" + id + "' não está definida.");
            return null;
        }
        if (symbolTable.get(id).isConstant()) {
            reportError("Impossível modificar bits de uma constante '" + id + "'.");
            return null;
        }
        visit(ctx.expression(0));
        visit(ctx.expression(1));
        visit(ctx.expression(2));
        return "number";
    }

    @Override
    public String visitIfStatement(bml26Parser.IfStatementContext ctx) {
        if (ctx.ifCondition().ERROR() == null) {
            visit(ctx.ifCondition().expression());
        }
        for (bml26Parser.StatementContext s : ctx.statement()) {
            visit(s);
        }
        return null;
    }

    @Override
    public String visitStatement(bml26Parser.StatementContext ctx) {
        if (ctx.declaration() != null)        return visit(ctx.declaration());
        if (ctx.assignment() != null)         return visit(ctx.assignment());
        if (ctx.bitAssignment() != null)      return visit(ctx.bitAssignment());
        if (ctx.bitRangeAssignment() != null) return visit(ctx.bitRangeAssignment());
        if (ctx.ifStatement() != null)        return visit(ctx.ifStatement());
        if (ctx.loopStatement() != null)      return visit(ctx.loopStatement());
        if (ctx.forStatement() != null)       return visit(ctx.forStatement());
        if (ctx.BREAK() != null)              return null;
        if (ctx.EXIT() != null)               { visit(ctx.expression()); return null; }
        if (ctx.PRINT() != null)              { visit(ctx.expression()); return null; }
        return null;
    }

    @Override
    public String visitForStatement(bml26Parser.ForStatementContext ctx) {
        String varName = ctx.ID().getText();
        boolean alreadyDeclared = symbolTable.containsKey(varName);
        Symbol oldSymbol = symbolTable.get(varName);
        
        String varType = "number";
        bml26Parser.ExpressionContext exprCtx = ctx.expression();
        if (exprCtx.primaryExpression() != null && exprCtx.primaryExpression().ID() != null) {
            String arrayId = exprCtx.primaryExpression().ID().getText();
            if (symbolTable.containsKey(arrayId)) {
                String arrayType = symbolTable.get(arrayId).getType();
                if (arrayType.startsWith("[")) {
                    String content = arrayType.substring(1, arrayType.length() - 1);
                    varType = content.split(";")[0].trim();
                }
            }
        }
        
        symbolTable.put(varName, new Symbol(varName, varType, false));
        
        visit(ctx.expression());
        for (bml26Parser.StatementContext s : ctx.statement()) {
            visit(s);
        }
        
        if (alreadyDeclared) {
            symbolTable.put(varName, oldSymbol);
        } else {
            symbolTable.remove(varName);
        }
        return null;
    }

    @Override
    public String visitLoopStatement(bml26Parser.LoopStatementContext ctx) {
        for (bml26Parser.StatementContext s : ctx.statement()) {
            visit(s);
        }
        return null;
    }

    @Override
    public String visitExpression(bml26Parser.ExpressionContext ctx) {
        if (ctx.primaryExpression() != null) {
            return visit(ctx.primaryExpression());
        }

        if (ctx.expression().size() == 2) {
            String leftType  = visit(ctx.expression(0));
            String rightType = visit(ctx.expression(1));
            String operator  = ctx.op != null ? ctx.op.getText() : "";

            if (operator.equals("+")) {
                if ("string".equals(leftType) || "string".equals(rightType)) return "string";
                return "number";
            }
            if ("string".equals(leftType) || "string".equals(rightType)) {
                reportError("Operação '" + operator + "' inválida entre tipos de texto.");
                return "error";
            }
            return "number";
        }

        if (ctx.expression().size() == 3) {
            visit(ctx.expression(0));
            visit(ctx.expression(1));
            visit(ctx.expression(2));
            return "number";
        }

        if (ctx.getChild(0) != null && ctx.getChild(0).getText().equals("(")) {
            return visit(ctx.expression(0));
        }

        return "number";
    }

    @Override
    public String visitPrimaryExpression(bml26Parser.PrimaryExpressionContext ctx) {
        if (ctx.ID() != null) {
            String id = ctx.ID().getText();
            if (ctx.getChildCount() > 1 && ctx.getChild(1).getText().equals("(")) {
                return "string";
            }
            if (symbolTable.containsKey(id)) {
                return symbolTable.get(id).getType().equals("string") ? "string" : "number";
            }
            reportError("A variável '" + id + "' está a ser usada mas não foi declarada.");
            return "error";
        }
        
        if (ctx.STRING_KW() != null) return "string";
        if (ctx.literal() != null && ctx.literal().STRING() != null) return "string";
        
        if (ctx.READ() != null && ctx.STRING() != null) {
            return "string";
        }
        
        if (ctx.INPUT() != null && ctx.PARSE() == null) {
            org.antlr.v4.runtime.RuleContext parent = ctx.parent;
            while (parent != null) {
                if (parent instanceof bml26Parser.DeclarationContext) {
                    String declType = ((bml26Parser.DeclarationContext)parent).type().getText();
                    if (!declType.equals("string")) {
                        return "number";
                    }
                    break;
                }
                if (parent instanceof bml26Parser.AssignmentContext) {
                    String parentId = ((bml26Parser.AssignmentContext)parent).ID().getText();
                    if (symbolTable.containsKey(parentId) && !symbolTable.get(parentId).getType().equals("string")) {
                        return "number";
                    }
                    break;
                }
                parent = parent.parent;
            }
            return "string";
        }
        
        if (ctx.PARSE() != null) return "number";

        if (ctx.DOTDOT() != null) {
            visit(ctx.expression(0));
            visit(ctx.expression(1));
            return "range";
        }
        
        return "number";
    }
}