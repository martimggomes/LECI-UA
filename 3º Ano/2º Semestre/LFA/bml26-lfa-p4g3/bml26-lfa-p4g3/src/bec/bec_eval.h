#pragma once
#include <iostream>
#include "antlr4-runtime.h"
#include "becLexer.h"
#include "becParser.h"
#include "InterpreterVisitor.h"

extern bool __bml_error_flag;

inline int64_t evaluate_bec_expression(const std::string& expression) {
    antlr4::ANTLRInputStream input(expression);
    becLexer lexer(&input);
    antlr4::CommonTokenStream tokens(&lexer);
    becParser parser(&tokens);
    parser.removeErrorListeners();

    becParser::ProgramContext* tree = parser.program();

    if (parser.getNumberOfSyntaxErrors() > 0) {
        __bml_error_flag = true;
        return 0;
    }

    InterpreterVisitor visitor;
    try {
        return visitor.visit(tree).as<int64_t>();
    } catch (...) {
        __bml_error_flag = true;
        return 0; 
    }
}