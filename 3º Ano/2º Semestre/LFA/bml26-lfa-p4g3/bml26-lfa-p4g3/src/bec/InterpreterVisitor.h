#pragma once
#include "becBaseVisitor.h"
#include <string>
#include <iostream>
#include <map>
#include "antlr4-runtime.h"

class InterpreterVisitor : public becBaseVisitor {
private:
    std::map<std::string, int64_t> memory;

public:
    antlrcpp::Any visitProgram(becParser::ProgramContext *ctx) override {
        for (auto *assignCtx : ctx->assignment()) {
            visit(assignCtx);
        }
        return visit(ctx->expr());
    }

    antlrcpp::Any visitAssignment(becParser::AssignmentContext *ctx) override {
        std::string id = ctx->INT_ID()->getText();
        int64_t val = visit(ctx->expr()).as<int64_t>();
        memory[id] = val;
        return val;
    }

    antlrcpp::Any visitExpr(becParser::ExprContext *ctx) override {
        if (ctx->INT_ID()) {
            std::string id = ctx->INT_ID()->getText();
            if (memory.find(id) != memory.end()) return memory[id];
            return (int64_t)0;
        }
        if (ctx->literal()) return visit(ctx->literal());
        if (ctx->expr().size() == 2) {
            int64_t left = visit(ctx->expr(0)).as<int64_t>();
            int64_t right = visit(ctx->expr(1)).as<int64_t>();
            std::string op = ctx->op->getText();
            if (op == "*") return (int64_t)((left * right) >> 8);
            if (op == "/") return (int64_t)((left << 8) / right);
            if (op == "+") return left + right;
            if (op == "-") return left - right;
            if (op == "<") return (int64_t)(left < right);
            if (op == ">") return (int64_t)(left > right);
            if (op == "<=") return (int64_t)(left <= right);
            if (op == ">=") return (int64_t)(left >= right);
            if (op == "==") return (int64_t)(left == right);
            if (op == "!=") return (int64_t)(left != right);
            if (op == "%") return left % right;
            if (op == "<<") return left << right;
            if (op == ">>") return left >> right;
            if (op == "and") return left & right;
            if (op == "xor") return left ^ right;
            if (op == "or") return left | right;
        }
        if (ctx->expr().size() == 1 && ctx->op != nullptr) {
            int64_t val = visit(ctx->expr(0)).as<int64_t>();
            std::string op = ctx->op->getText();
            if (op == "-") return -val;
            if (op == "+") return val;
            if (op == "not") return ~val;
        }
        if (ctx->children[0]->getText() == "(") {
            return visit(ctx->expr(0));
        }
        return (int64_t)0;
    }

    antlrcpp::Any visitLiteral(becParser::LiteralContext *ctx) override {
        if (ctx->INT()) {
            return (int64_t)(std::stoll(ctx->INT()->getText()) << 8);
        }
        if (ctx->REAL()) {
        std::string text = ctx->REAL()->getText();
        size_t dot_pos = text.find('.');
        
        int64_t int_part = 0;
        if (dot_pos > 0) {
            int_part = std::stoll(text.substr(0, dot_pos));
        }
        
        int64_t frac_val = 0;
        int64_t divisor = 1;
        std::string frac_str = text.substr(dot_pos + 1);
        
        if (!frac_str.empty()) {
            frac_val = std::stoll(frac_str);
            for (size_t i = 0; i < frac_str.length(); ++i) {
                divisor *= 10;
            }
        }
        return (int_part << 8) + (((frac_val * 256) + (divisor / 2)) / divisor);
        }
        return (int64_t)0;
    }
};