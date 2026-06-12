import org.stringtemplate.v4.*;
import java.util.Map;

public class CompilerVisitor extends bml26BaseVisitor<ST> {
    
    private STGroup templates;
    private Map<String, Symbol> symbolTable;

    public CompilerVisitor(Map<String, Symbol> symbolTable) {
        this.symbolTable = symbolTable;
        templates = new STGroupFile("bml26.stg", '$', '$');
    }

    // Método auxiliar para verificar se uma variável é um array
    private boolean isArray(String varName) {
        if (symbolTable != null && symbolTable.containsKey(varName)) {
            return symbolTable.get(varName).getType().startsWith("[");
        }
        return false;
    }

    private String parseInterpolatedString(String literalText) {
        String content = literalText.substring(1, literalText.length() - 1);
        StringBuilder sb = new StringBuilder();
        sb.append("string(\"");
        int len = content.length();
        StringBuilder currentSegment = new StringBuilder();
        
        for (int i = 0; i < len; i++) {
            char c = content.charAt(i);
            if (c == '{') {
                sb.append(escapeStringContent(currentSegment.toString()));
                currentSegment.setLength(0);
                i++;
                while (i < len && content.charAt(i) != '}') {
                    currentSegment.append(content.charAt(i));
                    i++;
                }
                String varName = currentSegment.toString().trim();

                if (isFixedPoint(varName)) {
                    int bits = getFractionalBits(symbolTable.get(varName).getType());
                    long divisor = 1L << bits;
                    long half = divisor / 2;
                    
                    sb.append("\") + ([&]() { int64_t val = (int64_t)(v_")
                    .append(varName)
                    .append("); int64_t i = val / ").append(divisor).append("; int64_t f = (val % ").append(divisor).append("); if (f < 0) f = -f; ")
                    .append("int64_t f_dec = ((f * 100) + ").append(half).append(") / ").append(divisor).append("; ")
                    .append("return to_string(i) + \".\" + (f_dec < 10 ? \"0\" : \"\") + to_string(f_dec); })() + string(\"");
                } else { 
                    sb.append("\") + __bml_stringify(v_").append(varName).append(") + string(\"");
                }
                
                currentSegment.setLength(0);
            } else {
                currentSegment.append(c);
            }
        }
        sb.append(escapeStringContent(currentSegment.toString()));
        sb.append("\")");
        
        String result = sb.toString();
        result = result.replace(" + string(\"\")", "");
        if (result.startsWith("string(\"\") + ")) {
            result = result.substring("string(\"\") + ".length());
        }
        return result;
    }

    private String escapeStringContent(String s) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (c == '"') sb.append("\\\"");
            else sb.append(c);
        }
        return sb.toString();
    }
    
    private boolean isFixedPoint(String varName) {
        if (symbolTable != null && symbolTable.containsKey(varName)) {
            return symbolTable.get(varName).getType().contains(".");
        }
        return false;
    }

    private boolean isFixedPoint(bml26Parser.ExpressionContext ctx) {
        if (ctx == null) return false;
        if (ctx.primaryExpression() != null) {
            bml26Parser.PrimaryExpressionContext pCtx = ctx.primaryExpression();
            if (pCtx.ID() != null && pCtx.LPAREN() == null) {
                return isFixedPoint(pCtx.ID().getText());
            }
            if (pCtx.literal() != null && pCtx.literal().getText().contains(".")) {
                return true;
            }
            if (pCtx.expression() != null && !pCtx.expression().isEmpty()) {
                return isFixedPoint(pCtx.expression(0));
            }
        }
        if (ctx.expression().size() == 2) {
            if (ctx.getChildCount() >= 3 && ctx.getChild(1).getText().equals("[")) {
                bml26Parser.ExpressionContext baseExpr = ctx.expression(0);
                if (baseExpr.primaryExpression() != null && baseExpr.primaryExpression().ID() != null) {
                    return isFixedPoint(baseExpr.primaryExpression().ID().getText());
                }
            }
            return isFixedPoint(ctx.expression(0)) || isFixedPoint(ctx.expression(1));
        }
        if (ctx.expression().size() == 1) {
            return isFixedPoint(ctx.expression(0));
        }
        return false;
    }

    @Override
    public ST visitProgram(bml26Parser.ProgramContext ctx) {
        ST progTemplate = templates.getInstanceOf("program");
        for (bml26Parser.StatementContext stmt : ctx.statement()) {
            ST stmtTemplate = visit(stmt);
            if (stmtTemplate != null) progTemplate.add("statements", stmtTemplate);
        }
        return progTemplate;
    }

    @Override
    public ST visitDeclaration(bml26Parser.DeclarationContext ctx) {
        ST declTemplate = templates.getInstanceOf("declaration");
        String bmlType = ctx.type().getText();
        declTemplate.add("type", mapTypeToCpp(bmlType));
        declTemplate.add("id", "v_" + ctx.ID().getText());
        if (ctx.expression() != null) {
            declTemplate.add("value", visit(ctx.expression()).render());
        }
        return declTemplate;
    }

    @Override
    public ST visitAssignment(bml26Parser.AssignmentContext ctx) {
        ST assignTemplate = templates.getInstanceOf("assignment");
        assignTemplate.add("id", "v_" + ctx.ID().getText());
        assignTemplate.add("value", visit(ctx.expression()).render());
        return assignTemplate;
    }

    @Override
    public ST visitBitAssignment(bml26Parser.BitAssignmentContext ctx) {
        String id = ctx.ID().getText();
        if (isArray(id)) {
            ST t = templates.getInstanceOf("assignment");
            t.add("id", "v_" + id + "[" + visit(ctx.expression(0)).render() + "]");
            t.add("value", visit(ctx.expression(1)).render());
            return t;
        } else {
            ST t = templates.getInstanceOf("setBit");
            t.add("id",    "v_" + id);
            t.add("bit",   visit(ctx.expression(0)).render());
            t.add("value", visit(ctx.expression(1)).render());
            return t;
        }
    }

    @Override
    public ST visitBitRangeAssignment(bml26Parser.BitRangeAssignmentContext ctx) {
        ST t = templates.getInstanceOf("setBitRange");
        t.add("id",    "v_" + ctx.ID().getText());
        t.add("low",   visit(ctx.expression(0)).render());
        t.add("high",  visit(ctx.expression(1)).render());
        t.add("value", visit(ctx.expression(2)).render());
        return t;
    }

    @Override
    public ST visitIfStatement(bml26Parser.IfStatementContext ctx) {
        String cond;
        if (ctx.ifCondition().ERROR() != null) {
            cond = "__bml_error_flag";
        } else {
            cond = visit(ctx.ifCondition().expression()).render();
        }

        boolean hasElse = ctx.ELSE() != null;
        ST t = templates.getInstanceOf(hasElse ? "ifElseStat" : "ifStat");
        t.add("cond", cond);

        for (bml26Parser.StatementContext stmt : ctx.statement()) {
            ST stmtST = visit(stmt);
            if (stmtST == null) continue;
            if (ctx.ELSE() == null || stmt.getStart().getTokenIndex() < ctx.ELSE().getSymbol().getTokenIndex()) {
                t.add("thenStmts", stmtST);
            } else {
                t.add("elseStmts", stmtST);
            }
        }
        return t;
    }

    @Override
    public ST visitStatement(bml26Parser.StatementContext ctx) {
        if (ctx.declaration() != null)       return visit(ctx.declaration());
        if (ctx.assignment() != null)        return visit(ctx.assignment());
        if (ctx.bitAssignment() != null)     return visit(ctx.bitAssignment());
        if (ctx.bitRangeAssignment() != null) return visit(ctx.bitRangeAssignment());
        if (ctx.ifStatement() != null)       return visit(ctx.ifStatement());
        if (ctx.loopStatement() != null)     return visit(ctx.loopStatement());
        if (ctx.forStatement() != null)      return visit(ctx.forStatement());

        if (ctx.BREAK() != null) {                                              
            return templates.getInstanceOf("breakStat");
        }

        if (ctx.EXIT() != null) {
            ST t = templates.getInstanceOf("exitStat");
            t.add("code", visit(ctx.expression()).render());
            return t;
        }

        if (ctx.PRINT() != null) {
            String exprStr = visit(ctx.expression()).render();
            
            if (ctx.output() != null) {
                if (ctx.output().STRING() != null) {
                    ST t = templates.getInstanceOf("printToFile");
                    t.add("expr", exprStr);
                    t.add("file", ctx.output().STRING().getText());
                    return t;
                } 
                else {
                    ST t = templates.getInstanceOf("printTo");
                    t.add("expr", exprStr);
                    String dest = ctx.output().STDERR() != null ? "cerr" : "cout";
                    t.add("dest", dest);
                    return t;
                }
            } else {
                ST t = templates.getInstanceOf("print");
                t.add("expr", exprStr);
                return t;
            }
        }
        return null;
    }

    @Override
    public ST visitForStatement(bml26Parser.ForStatementContext ctx) {
        bml26Parser.ExpressionContext exprCtx = ctx.expression();
        String varName = ctx.ID().getText();
        
        ST t;
        if (exprCtx.primaryExpression() != null && exprCtx.primaryExpression().DOTDOT() != null) {
            t = templates.getInstanceOf("forRangeStat");
            t.add("var", "v_" + varName);
            t.add("low", visit(exprCtx.primaryExpression().expression(0)).render());
            t.add("high", visit(exprCtx.primaryExpression().expression(1)).render());
        } else {
            t = templates.getInstanceOf("forArrayStat");
            t.add("var", "v_" + varName);
            t.add("array", visit(exprCtx).render());
        }
        
        for (bml26Parser.StatementContext s : ctx.statement()) {
            ST stmtST = visit(s);
            if (stmtST != null) t.add("statements", stmtST);
        }
        return t;
    }

    @Override
    public ST visitLoopStatement(bml26Parser.LoopStatementContext ctx) {
        ST t = templates.getInstanceOf("loopStat");
        for (bml26Parser.StatementContext s : ctx.statement()) {
            ST stmtST = visit(s);
            if (stmtST != null) {
                t.add("statements", stmtST);
            }
        }
        return t;
    }

    @Override
    public ST visitExpression(bml26Parser.ExpressionContext ctx) {
        if (ctx.primaryExpression() != null) return visit(ctx.primaryExpression());

        if (ctx.expression().size() == 2) {
            String operator = ctx.op != null ? ctx.op.getText() : "";

            if (operator.isEmpty() && ctx.getChild(1).getText().equals("[") && ctx.getChild(3).getText().equals("]")) {
                String base = visit(ctx.expression(0)).render();
                String idx  = visit(ctx.expression(1)).render();
                if (ctx.expression(0).primaryExpression() != null && ctx.expression(0).primaryExpression().ID() != null) {
                    String id = ctx.expression(0).primaryExpression().ID().getText();
                    if (isArray(id)) {
                        return new ST(base + "[" + idx + "]");
                    }
                }
                return new ST("((" + base + " >> " + idx + ") & 1)");
            }

            int leftBits = getFractionalBits(ctx.expression(0));
            int rightBits = getFractionalBits(ctx.expression(1));
            String leftStr = visit(ctx.expression(0)).render();
            String rightStr = visit(ctx.expression(1)).render();

            if (operator.equals("+") || operator.equals("-") || operator.equals("==") || operator.equals("!=") ||
                operator.equals("<") || operator.equals(">") || operator.equals("<=") || operator.equals(">=")) {
                if (leftBits > rightBits) {
                    rightStr = "(" + rightStr + " << " + (leftBits - rightBits) + ")";
                } else if (rightBits > leftBits) {
                    leftStr = "(" + leftStr + " << " + (rightBits - leftBits) + ")";
                }
            }

            if (operator.equals("*")) {
                int targetBits = getTargetFracBits(ctx);
                int currentBits = leftBits + rightBits;
                int shift = currentBits - targetBits;
                if (shift > 0) {
                    return new ST("((int64_t)(" + leftStr + ") * (int64_t)(" + rightStr + ") >> " + shift + ")");
                } else if (shift < 0) {
                    return new ST("((int64_t)(" + leftStr + ") * (int64_t)(" + rightStr + ") << " + (-shift) + ")");
                } else {
                    return new ST("((int64_t)(" + leftStr + ") * (int64_t)(" + rightStr + "))");
                }
            }

            if (operator.equals("/")) {
                int targetBits = getTargetFracBits(ctx);
                int totalShift = targetBits + rightBits - leftBits;
                if (totalShift > 0) {
                    return new ST("(((int64_t)(" + leftStr + ") << " + totalShift + ") / " + rightStr + ")");
                } else if (totalShift < 0) {
                    return new ST("(((int64_t)(" + leftStr + ") >> " + (-totalShift) + ") / " + rightStr + ")");
                } else {
                    return new ST("((int64_t)(" + leftStr + ") / " + rightStr + ")");
                }
            }

            ST opTemplate = templates.getInstanceOf("binaryOp");
            opTemplate.add("left",  leftStr);
            opTemplate.add("right", rightStr);
            if (operator.equals("or"))  operator = "|";
            if (operator.equals("and")) operator = "&";
            if (operator.equals("xor")) operator = "^";
            opTemplate.add("op", operator);
            return opTemplate;
        }

        if (ctx.expression().size() == 3) {
            String base = visit(ctx.expression(0)).render();
            String low  = visit(ctx.expression(1)).render();
            String high = visit(ctx.expression(2)).render();
            return new ST("((" + base + " >> " + low + ") & ((1LL << (" + high + " - " + low + " + 1)) - 1))");
        }
        
        if (ctx.expression().size() == 1 && ctx.op != null) {
            String operator = ctx.op.getText();
            if (operator.equals("not")) operator = "!";
            return new ST("(" + operator + visit(ctx.expression(0)).render() + ")");
        }

        if (ctx.getChild(0).getText().equals("(")) {
            ST parensTemplate = templates.getInstanceOf("parens");
            parensTemplate.add("expr", visit(ctx.expression(0)).render());
            return parensTemplate;
        }
        return new ST("/* expressao desconhecida */");
    }

    @Override
    public ST visitPrimaryExpression(bml26Parser.PrimaryExpressionContext ctx) {
        if (ctx.ID() != null) {
            if (ctx.getChildCount() > 1 && ctx.getChild(1).getText().equals("(")) {
                if (ctx.expression().size() == 2) {
                    ST castTemplate = templates.getInstanceOf("typeCastBase");
                    castTemplate.add("expr", visit(ctx.expression(0)).render());
                    castTemplate.add("base", visit(ctx.expression(1)).render());
                    return castTemplate;
                }
                
                if (isFixedPoint(ctx.expression(0))) {
                    int bits = getFractionalBits(ctx.expression(0));
                    long divisor = 1L << bits;
                    long half = divisor / 2;
                    String exprRendered = visit(ctx.expression(0)).render();
                    
                    ST rawST = new ST("<raw>");
                    rawST.add("raw", "([&]() { int64_t val = (int64_t)(" + exprRendered + "); int64_t i = val / " + divisor + "; int64_t f = val % " + divisor + "; if (f < 0) f = -f; int64_t f_dec = ((f * 100) + " + half + ") / " + divisor + "; return to_string(i) + \".\" + (f_dec < 10 ? \"0\" : \"\") + to_string(f_dec); })()");
                    return rawST;
                } else {
                    ST castTemplate = templates.getInstanceOf("typeCast");
                    castTemplate.add("expr", visit(ctx.expression(0)).render()); 
                    return castTemplate;
                }
            }
            return new ST("v_" + ctx.ID().getText()); 
        }
        
        if (ctx.STRING_KW() != null) {
            if (ctx.expression().size() == 2) {
                ST castTemplate = templates.getInstanceOf("typeCastBase");
                castTemplate.add("expr", visit(ctx.expression(0)).render());
                castTemplate.add("base", visit(ctx.expression(1)).render());
                return castTemplate;
            }
            
            if (isFixedPoint(ctx.expression(0))) {
                int bits = getFractionalBits(ctx.expression(0));
                long divisor = 1L << bits;
                long half = divisor / 2;
                String exprRendered = visit(ctx.expression(0)).render();
                
                ST rawST = new ST("<raw>");
                rawST.add("raw", "([&]() { int64_t val = (int64_t)(" + exprRendered + "); int64_t i = val / " + divisor + "; int64_t f = val % " + divisor + "; if (f < 0) f = -f; int64_t f_dec = ((f * 100) + " + half + ") / " + divisor + "; return to_string(i) + \".\" + (f_dec < 10 ? \"0\" : \"\") + to_string(f_dec); })()");
                return rawST;
            } else {
                ST castTemplate = templates.getInstanceOf("typeCast");
                castTemplate.add("expr", visit(ctx.expression(0)).render()); 
                return castTemplate;
            }
        }

        // INPUT e PARSE
        if (ctx.PARSE() != null) {
            String innerExpr;
            if (ctx.INPUT() != null) {
                String prompt = ctx.STRING() != null ? ctx.STRING().getText() : "\"\"";
                innerExpr = "__bml_input(" + prompt + ")";
            } else {
                innerExpr = visit(ctx.expression(0)).render();
            }
            
            if (innerExpr.contains("__bml_parse") && innerExpr.contains(">> 8")) {
                return new ST(innerExpr);
            }
            
            String parseCall = innerExpr.contains("__bml_parse") ? innerExpr : "__bml_parse(" + innerExpr + ")";

            org.antlr.v4.runtime.RuleContext parent = ctx.parent;
            while (parent != null) {
                String id = null;
                if (parent instanceof bml26Parser.DeclarationContext) {
                    String declType = ((bml26Parser.DeclarationContext)parent).type().getText();
                    if (!declType.equals("string")) {
                        String cppType = mapTypeToCpp(declType);
                        return new ST(declType.contains(".") ? parseCall : "((" + cppType + ")" + parseCall + " >> 8)");
                    }
                    break;
                }
                if (parent instanceof bml26Parser.AssignmentContext) {
                    id = ((bml26Parser.AssignmentContext)parent).ID().getText();
                } else if (parent instanceof bml26Parser.BitAssignmentContext) {
                    id = ((bml26Parser.BitAssignmentContext)parent).ID().getText();
                }

                if (id != null && symbolTable != null && symbolTable.containsKey(id)) {
                    String type = symbolTable.get(id).getType();
                    if (!type.equals("string")) {
                        if (type.startsWith("[") && type.endsWith("]")) {
                            String content = type.substring(1, type.length() - 1);
                            type = content.split(";")[0].trim();
                        }
                        String cppType = mapTypeToCpp(type);
                        return new ST(type.contains(".") ? parseCall : "((" + cppType + ")" + parseCall + " >> 8)");
                    }
                    break;
                }
                parent = parent.parent;
            }
            return new ST(parseCall);
        }
        
        if (ctx.INPUT() != null && ctx.PARSE() == null) {
            String prompt = ctx.STRING() != null ? ctx.STRING().getText() : "\"\"";
            org.antlr.v4.runtime.RuleContext parent = ctx.parent;
            while (parent != null) {
                String id = null;
                if (parent instanceof bml26Parser.DeclarationContext) {
                    String declType = ((bml26Parser.DeclarationContext)parent).type().getText();
                    if (!declType.equals("string")) {
                        String cppType = mapTypeToCpp(declType);
                        return new ST(declType.contains(".") ? "__bml_parse(__bml_input(" + prompt + "))" : "((" + cppType + ")__bml_parse(__bml_input(" + prompt + ")) >> 8)");
                    }
                    break;
                }
                if (parent instanceof bml26Parser.AssignmentContext) {
                    id = ((bml26Parser.AssignmentContext)parent).ID().getText();
                } else if (parent instanceof bml26Parser.BitAssignmentContext) {
                    id = ((bml26Parser.BitAssignmentContext)parent).ID().getText();
                }

                if (id != null && symbolTable != null && symbolTable.containsKey(id)) {
                    String type = symbolTable.get(id).getType();
                    if (!type.equals("string")) {
                        if (type.startsWith("[") && type.endsWith("]")) {
                            String content = type.substring(1, type.length() - 1);
                            type = content.split(";")[0].trim();
                        }
                        String cppType = mapTypeToCpp(type);
                        return new ST(type.contains(".") ? "__bml_parse(__bml_input(" + prompt + "))" : "((" + cppType + ")__bml_parse(__bml_input(" + prompt + ")) >> 8)");
                    }
                    break;
                }
                parent = parent.parent;
            }
            return new ST("__bml_input(" + prompt + ")");
        }

        if (ctx.READ() != null && ctx.STRING() != null) {
            String filePath = ctx.STRING().getText();
            return new ST("__bml_read_file(" + filePath + ")");
        }

        if (ctx.literal() != null) {
            if (ctx.literal().STRING() != null) {
                String text = ctx.literal().getText();
                if (text.contains("{") && text.contains("}")) {
                    ST st = new ST("<raw>");
                    st.add("raw", parseInterpolatedString(text));
                    return st;
                }
                return new ST("string(" + text + ")");
            }
            
            String text = ctx.literal().getText();
            if (text.contains(".")) {
                int fracBits = 8; 
                
                try {
                    org.antlr.v4.runtime.RuleContext parentNode = ctx.parent;
                    while (parentNode != null) {
                        String targetType = null;
                        if (parentNode instanceof bml26Parser.DeclarationContext) {
                            targetType = ((bml26Parser.DeclarationContext)parentNode).type().getText();
                        } else if (parentNode instanceof bml26Parser.AssignmentContext) {
                            String id = ((bml26Parser.AssignmentContext)parentNode).ID().getText();
                            if (symbolTable != null && symbolTable.containsKey(id)) {
                                targetType = symbolTable.get(id).getType();
                            }
                        }

                        if (targetType != null && targetType.contains(".")) {
                            fracBits = getFractionalBits(targetType);
                            break;
                        }
                        parentNode = parentNode.parent;
                    }
                } catch (Exception e) {
                }

                long multiplier = 1L << fracBits; 
                long scaled = Math.round(Double.parseDouble(text) * multiplier);
                return new ST(String.valueOf(scaled) + "LL");
            }
            return new ST(text + (text.length() > 9 ? "LL" : ""));
        }
        
        return new ST("/* primary exp */");
    }
    
    private String mapTypeToCpp(String bmlType) {
        if (bmlType.startsWith("[") && bmlType.endsWith("]")) {
            String content = bmlType.substring(1, bmlType.length() - 1);
            String[] parts = content.split(";");
            return "array<" + mapTypeToCpp(parts[0].trim()) + ", " + parts[1].trim() + ">";
        }
        if (bmlType.equals("s64") || bmlType.contains("s64.")) return "int64_t";
        if (bmlType.equals("u64") || bmlType.contains("u64.")) return "uint64_t";
        if (bmlType.equals("s32") || bmlType.contains("s32.")) return "int32_t";
        if (bmlType.equals("u32") || bmlType.contains("u32.")) return "uint32_t";
        if (bmlType.equals("s16") || bmlType.contains("s16.")) return "int16_t";
        if (bmlType.equals("u16") || bmlType.contains("u16.")) return "uint16_t";
        if (bmlType.equals("s8")  || bmlType.contains("s8."))  return "int8_t";
        if (bmlType.equals("u8")  || bmlType.contains("u8."))  return "uint8_t";
        if (bmlType.equals("u1"))  return "uint8_t";
        if (bmlType.equals("string")) return "string";
        return "int32_t"; 
    }

    private int getFractionalBits(String type) {
        if (type == null || !type.contains(".")) return 0;
        try {
            int dotIdx = type.indexOf('.');
            StringBuilder sb = new StringBuilder();
            for (int i = dotIdx + 1; i < type.length(); i++) {
                char c = type.charAt(i); 
                if (Character.isDigit(c)) sb.append(c);
                else break;
            }
            return Integer.parseInt(sb.toString());
        } catch (Exception e) {
            return 0;
        }
    }

    private int getFractionalBits(bml26Parser.ExpressionContext ctx) {
        if (ctx == null) return 0;
        if (ctx.primaryExpression() != null) {
            bml26Parser.PrimaryExpressionContext pCtx = ctx.primaryExpression();
            if (pCtx.ID() != null && pCtx.LPAREN() == null) {
                String id = pCtx.ID().getText();
                if (symbolTable != null && symbolTable.containsKey(id)) {
                    return getFractionalBits(symbolTable.get(id).getType());
                }
            }
            if (pCtx.literal() != null && pCtx.literal().getText().contains(".")) {
                return getTargetFracBits(ctx);
            }
        }
        if (ctx.expression().size() == 2) {
            int left = getFractionalBits(ctx.expression(0));
            int right = getFractionalBits(ctx.expression(1));
            String op = ctx.op != null ? ctx.op.getText() : "";
            if (op.equals("*")) return left + right;
            return Math.max(left, right);
        }
        if (ctx.expression().size() == 1) return getFractionalBits(ctx.expression(0));
        return 0;
    }

    private int getTargetFracBits(org.antlr.v4.runtime.RuleContext ctx) {
        org.antlr.v4.runtime.RuleContext parent = ctx.parent;
        while (parent != null) {
            String targetType = null;
            if (parent instanceof bml26Parser.DeclarationContext) {
                targetType = ((bml26Parser.DeclarationContext)parent).type().getText();
            } else if (parent instanceof bml26Parser.AssignmentContext) {
                String id = ((bml26Parser.AssignmentContext)parent).ID().getText();
                if (symbolTable != null && symbolTable.containsKey(id)) targetType = symbolTable.get(id).getType();
            }
            if (targetType != null) return getFractionalBits(targetType);
            parent = parent.parent;
        }
        return 8; 
    }
}