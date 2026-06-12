// Generated from bml26.g4 by ANTLR 4.9.3
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link bml26Parser}.
 */
public interface bml26Listener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link bml26Parser#program}.
	 * @param ctx the parse tree
	 */
	void enterProgram(bml26Parser.ProgramContext ctx);
	/**
	 * Exit a parse tree produced by {@link bml26Parser#program}.
	 * @param ctx the parse tree
	 */
	void exitProgram(bml26Parser.ProgramContext ctx);
	/**
	 * Enter a parse tree produced by {@link bml26Parser#statement}.
	 * @param ctx the parse tree
	 */
	void enterStatement(bml26Parser.StatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link bml26Parser#statement}.
	 * @param ctx the parse tree
	 */
	void exitStatement(bml26Parser.StatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link bml26Parser#forStatement}.
	 * @param ctx the parse tree
	 */
	void enterForStatement(bml26Parser.ForStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link bml26Parser#forStatement}.
	 * @param ctx the parse tree
	 */
	void exitForStatement(bml26Parser.ForStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link bml26Parser#loopStatement}.
	 * @param ctx the parse tree
	 */
	void enterLoopStatement(bml26Parser.LoopStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link bml26Parser#loopStatement}.
	 * @param ctx the parse tree
	 */
	void exitLoopStatement(bml26Parser.LoopStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link bml26Parser#output}.
	 * @param ctx the parse tree
	 */
	void enterOutput(bml26Parser.OutputContext ctx);
	/**
	 * Exit a parse tree produced by {@link bml26Parser#output}.
	 * @param ctx the parse tree
	 */
	void exitOutput(bml26Parser.OutputContext ctx);
	/**
	 * Enter a parse tree produced by {@link bml26Parser#declaration}.
	 * @param ctx the parse tree
	 */
	void enterDeclaration(bml26Parser.DeclarationContext ctx);
	/**
	 * Exit a parse tree produced by {@link bml26Parser#declaration}.
	 * @param ctx the parse tree
	 */
	void exitDeclaration(bml26Parser.DeclarationContext ctx);
	/**
	 * Enter a parse tree produced by {@link bml26Parser#assignment}.
	 * @param ctx the parse tree
	 */
	void enterAssignment(bml26Parser.AssignmentContext ctx);
	/**
	 * Exit a parse tree produced by {@link bml26Parser#assignment}.
	 * @param ctx the parse tree
	 */
	void exitAssignment(bml26Parser.AssignmentContext ctx);
	/**
	 * Enter a parse tree produced by {@link bml26Parser#bitAssignment}.
	 * @param ctx the parse tree
	 */
	void enterBitAssignment(bml26Parser.BitAssignmentContext ctx);
	/**
	 * Exit a parse tree produced by {@link bml26Parser#bitAssignment}.
	 * @param ctx the parse tree
	 */
	void exitBitAssignment(bml26Parser.BitAssignmentContext ctx);
	/**
	 * Enter a parse tree produced by {@link bml26Parser#bitRangeAssignment}.
	 * @param ctx the parse tree
	 */
	void enterBitRangeAssignment(bml26Parser.BitRangeAssignmentContext ctx);
	/**
	 * Exit a parse tree produced by {@link bml26Parser#bitRangeAssignment}.
	 * @param ctx the parse tree
	 */
	void exitBitRangeAssignment(bml26Parser.BitRangeAssignmentContext ctx);
	/**
	 * Enter a parse tree produced by {@link bml26Parser#ifStatement}.
	 * @param ctx the parse tree
	 */
	void enterIfStatement(bml26Parser.IfStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link bml26Parser#ifStatement}.
	 * @param ctx the parse tree
	 */
	void exitIfStatement(bml26Parser.IfStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link bml26Parser#ifCondition}.
	 * @param ctx the parse tree
	 */
	void enterIfCondition(bml26Parser.IfConditionContext ctx);
	/**
	 * Exit a parse tree produced by {@link bml26Parser#ifCondition}.
	 * @param ctx the parse tree
	 */
	void exitIfCondition(bml26Parser.IfConditionContext ctx);
	/**
	 * Enter a parse tree produced by {@link bml26Parser#type}.
	 * @param ctx the parse tree
	 */
	void enterType(bml26Parser.TypeContext ctx);
	/**
	 * Exit a parse tree produced by {@link bml26Parser#type}.
	 * @param ctx the parse tree
	 */
	void exitType(bml26Parser.TypeContext ctx);
	/**
	 * Enter a parse tree produced by {@link bml26Parser#expression}.
	 * @param ctx the parse tree
	 */
	void enterExpression(bml26Parser.ExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link bml26Parser#expression}.
	 * @param ctx the parse tree
	 */
	void exitExpression(bml26Parser.ExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link bml26Parser#primaryExpression}.
	 * @param ctx the parse tree
	 */
	void enterPrimaryExpression(bml26Parser.PrimaryExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link bml26Parser#primaryExpression}.
	 * @param ctx the parse tree
	 */
	void exitPrimaryExpression(bml26Parser.PrimaryExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link bml26Parser#literal}.
	 * @param ctx the parse tree
	 */
	void enterLiteral(bml26Parser.LiteralContext ctx);
	/**
	 * Exit a parse tree produced by {@link bml26Parser#literal}.
	 * @param ctx the parse tree
	 */
	void exitLiteral(bml26Parser.LiteralContext ctx);
}