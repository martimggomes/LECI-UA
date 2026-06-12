/* 
 * BML26 (Bit Manipulation Language 2026)
 * ANTLR4 Grammar Definition
 */
grammar bml26;

// ============================================================================
// PARSER RULES
// ============================================================================
program
    : statement* EOF
    ;
statement
    : declaration SEMICOLON
    | assignment SEMICOLON
    | bitAssignment SEMICOLON
    | bitRangeAssignment SEMICOLON
    | PRINT expression (REDIRECT output)? SEMICOLON
    | ifStatement
    | loopStatement    
    | forStatement            
    | BREAK SEMICOLON              
    | EXIT expression SEMICOLON
    ;
forStatement                       
    : FOR ID IN expression LBRACE statement* RBRACE
    ;
loopStatement                      
    : LOOP LBRACE statement* RBRACE
    ;
output
    : STDOUT
    | STDERR
    | STRING
    ;
declaration
    : VAR ID COLON type (ASSIGN expression)?
    | CONST ID COLON type ASSIGN expression
    ;
assignment
    : ID ASSIGN expression
    ;
bitAssignment
    : ID LBRACKET expression RBRACKET ASSIGN expression
    ;
bitRangeAssignment
    : ID LBRACKET expression DOTDOT expression RBRACKET ASSIGN expression
    ;
ifStatement
    : IF ifCondition LBRACE statement* RBRACE (ELSE LBRACE statement* RBRACE)?
    ;
ifCondition
    : ERROR
    | expression
    ;
type
    : TYPE_INT
    | TYPE_FIXED
    | STRING_KW
    | TYPE_U1
    | LBRACKET type SEMICOLON INT RBRACKET
    ;

expression
    : primaryExpression
    | expression '[' expression ']'                             
    | expression '[' expression DOTDOT expression ']'                                        
    | '(' expression ')'                                        
    | op=(NOT | MINUS | PLUS | BITNOT) expression               
    | expression op=(MUL | DIV | MOD) expression
    | expression op=(PLUS | MINUS) expression
    | expression op=(LSHIFT | RSHIFT) expression
    | expression op=(LT | GT | LE | GE) expression 
    | expression op=(EQ | NEQ) expression 
    | expression op=BITAND expression
    | expression op=XOR expression
    | expression op=BITOR expression
    | expression op=AND expression
    | expression op=OR expression         
    ;
primaryExpression
    : ID
    | literal
    | (ID | STRING_KW) '(' expression (COMMA expression)* ')'  
    | PARSE expression                        
    | PARSE INPUT STRING                      
    | PARSE INPUT                             
    | INPUT STRING
    | INPUT
    | READ STRING
    | LBRACKET expression DOTDOT expression RBRACKET
    ;
literal
    : INT
    | HEX
    | BINARY
    | FIXED_LIT
    | STRING
    ;

// ============================================================================
// LEXER RULES
// ============================================================================
// Keywords

VAR         : 'var' ;
CONST       : 'const' ;
PRINT       : 'print' ;
INPUT       : 'input' ;
READ        : 'read' ;
PARSE       : 'parse' ;
STRING_KW   : 'string' ;
OR          : 'or' ;
AND         : 'and' ;
NOT         : 'not' ;
IF          : 'if' ;
ELSE        : 'else' ;
LOOP        : 'loop' ;
BREAK       : 'break' ;
FOR         : 'for' ;
IN          : 'in' ;
EXIT        : 'exit' ;
ERROR       : 'error' ;
STDOUT      : 'stdout' ;
STDERR      : 'stderr' ;
// Operators
ASSIGN      : '=' ;
PLUS        : '+' ;
MINUS       : '-' ;
MUL         : '*' ;
DIV         : '/' ;
MOD         : '%' ;
LSHIFT      : '<<' ;
RSHIFT      : '>>' ;
BITOR       : '|' ;
BITAND      : '&' ;
XOR         : 'xor' | '^' ;
BITNOT      : '~' ;
REDIRECT    : '>>>' ;
// Comparison operators
EQ          : '==' ;
NEQ         : '!=' ;
LT          : '<' ;
GT          : '>' ;
LE          : '<=' ;
GE          : '>=' ;
// Delimiters
SEMICOLON   : ';' ;
COLON       : ':' ;
COMMA       : ',' ;
LPAREN      : '(' ;
RPAREN      : ')' ;
LBRACKET    : '[' ;
RBRACKET    : ']' ;
LBRACE      : '{' ;
RBRACE      : '}' ;
DOTDOT      : '..' ;
// Literals
INT
    : [0-9]+
    ;
HEX
    : '0x' [0-9a-fA-F]+
    | '0X' [0-9a-fA-F]+
    ;
BINARY
    : '0b' [01]+
    | '0B' [01]+
    ;
FIXED_LIT
    : [0-9]+ '.' [0-9]+
    | '.' [0-9]+
    ;
STRING
    : '"' (~["\\\r\n] | '\\' . )* '"'
    | '\'' (~['\\\r\n] | '\\' . )* '\''
    ;
TYPE_FIXED  
    : ('s'|'u') ('8'|'16'|'32'|'64') '.' [0-9]+ 
    ;
TYPE_INT    
    : ('s'|'u') ('8'|'16'|'32'|'64') 
    ;
TYPE_U1
    : 'u1'
    ;
// Identifier
ID
    : [a-zA-Z_] [a-zA-Z0-9_]*
    ;
// Whitespace and Comments
WS
    : [ \t\r\n\u000B\u000C\u00A0]+ -> skip
    ;
BLOCKCOMMENT2
    : '<#' .*? '#>' -> skip
    ;
BLOCKCOMMENT
    : '/*' .*? '*/' -> skip
    ;
LINECOMMENT
    : '#' ~[\r\n]* -> skip
    ;