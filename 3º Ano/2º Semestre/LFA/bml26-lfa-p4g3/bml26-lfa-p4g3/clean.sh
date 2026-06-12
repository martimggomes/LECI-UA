#!/bin/bash

echo ">>> A limpar binários na raiz..."
rm -f *_run
rm -f .last_exec

echo ">>> A limpar o compilador Java (BML26)..."
cd src/bml26
rm -f *.class bml26Lexer.* bml26Parser.* bml26Visitor.java bml26BaseVisitor.java bml26.tokens bml26Lexer.tokens
rm -f *.cpp
cd ../..

echo ">>> A limpar o interpretador C++ (BEC)..."
cd src/bec
rm -f becLexer.* becParser.* becVisitor.* becBaseVisitor.* bec.tokens becLexer.tokens
cd ../..

echo ">>> Limpeza concluída!"