grammar bec;

program : (assignment ';')* expr EOF ;

assignment : INT_ID '=' expr ;

expr
    : INT_ID
    | literal
    | '(' expr ')'
    | op=(NOT | PLUS | MINUS) expr
    | expr op=(MUL | DIV | MOD) expr
    | expr op=(PLUS | MINUS) expr
    | expr op=(LSHIFT | RSHIFT) expr
    | expr op=(LT | GT | LE | GE) expr
    | expr op=(EQ | NEQ) expr
    | expr op=AND expr
    | expr op=XOR expr
    | expr op=OR expr
    ;

literal
    : INT | REAL
    ;

// --- OPERADORES E PALAVRAS-CHAVE ---
MUL    : '*' ;
DIV    : '/' ;
MOD    : '%' ;
PLUS   : '+' ;
MINUS  : '-' ;
LSHIFT : '<<' ;
RSHIFT : '>>' ;
LT     : '<' ;
GT     : '>' ;
LE     : '<=' ;
GE     : '>=' ;
EQ     : '==' ;
NEQ    : '!=' ;
AND    : 'and' ;
OR     : 'or' ;
XOR    : 'xor' ;
NOT    : 'not' ;

// --- IDENTIFICADORES, NÚMEROS E ESPAÇOS ---
INT_ID : [a-zA-Z_] [a-zA-Z0-9_]* ;
INT    : [0-9]+ ;
REAL   : [0-9]+ '.' [0-9]* | '.' [0-9]+ ;
WS     : [ \t\r\n]+ -> skip ;