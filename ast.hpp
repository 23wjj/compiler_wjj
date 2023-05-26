#ifndef _AST_H_

#define _AST_H_

#include <iostream>
#include <vector>
#include <llvm/IR/Value.h>
#include <string>
#include <cstdio>
#include <cstring>

class Statement;
class Expression;
class VariableDeclaration;
class CodeGenContext;

typedef std::vector<Statement *> StatementList;
typedef std::vector<Expression *> ExpressionList;
typedef std::vector<VariableDeclaration *> VariableList;

class Node {
public:
    Node() {}
    virtual ~Node() {}

    virtual llvm::Value* CodeGen(CodeGenContext &ctx){
        return nullptr;
    }
};

class Expression : public Node {

};

class Statement : public Node {

};

class Integer : public Expression {
public:
    int value;

    Integer(int value) : value(value) {
        printf("const integer: %d\n", value);
    }

    virtual llvm::Value *CodeGen(CodeGenContext &ctx) override;
};

class Double : public Expression {
public:
    double value;

    Double(double value) : value(value) {
        printf("const double: %f\n", value);
    }

    virtual llvm::Value *CodeGen(CodeGenContext &ctx) override;
};

class Char : public Expression {
public:
    char value;
    Char(std::string val) {
        value=val[1];
        printf("const char: %c\n", value);
    }
    virtual llvm::Value *CodeGen(CodeGenContext &ctx) override;
};

class String : public Expression {
public:
    std::string value;
    String(std::string val) {
        value = val.substr(1, val.length()-2);
        int pos;
        while((pos=value.find("\\n"))!=std::string::npos){
            value = value.replace(pos, 2, "\n");
        }
        std::cout<<"const sting: "<<value<<std::endl;
    }
    virtual llvm::Value *CodeGen(CodeGenContext &ctx) override;
};

class Identifier : public Expression {
public:
    std::string &name;

    Identifier(std::string &name) : name(name) {
        std::cout<<"identifier :"<<name<<std::endl;
    }

    virtual llvm::Value *CodeGen(CodeGenContext &ctx) override;
};

class BinaryOperate : public Expression {
public:
    int op;
    Expression &lhs;
    Expression &rhs;

    BinaryOperate(Expression &lhs, int op, Expression &rhs) :
            lhs(lhs), rhs(rhs), op(op) {
        std::cout<<"binary operator: "<<op << std::endl;
    }

    virtual llvm::Value *CodeGen(CodeGenContext &ctx) override;
};

class Assignment : public Expression {
public:
    Identifier &lhs;
    Expression &rhs;

    Assignment(Identifier &lhs, Expression &rhs) :
            lhs(lhs), rhs(rhs) {}

    virtual llvm::Value *CodeGen(CodeGenContext &ctx) override;
};

class Block : public Expression {
public:
    StatementList statements;
    Block() {}
    Block(StatementList statements) : statements(statements){}

    virtual llvm::Value *CodeGen(CodeGenContext &ctx) override;
};

class FunctionCall : public Expression {
public:
    const Identifier &id;
    ExpressionList &args;

    FunctionCall(const Identifier &id, ExpressionList &args) :
            id(id), args(args) {
        std::cout<<"function call"<<id.name<<std::endl;
    }


    virtual llvm::Value *CodeGen(CodeGenContext &ctx) override;
};

class VariableDeclaration : public Statement {
public:
    const Identifier &type;
    Identifier &id;
    Expression *assignexp= nullptr;
    int size=0; // indicate the element number of the array

    VariableDeclaration(const Identifier &type, Identifier &id) :
            type(type), id(id) {
        std::cout<<"variable declaration: "<<type.name<<" "<<id.name<<std::endl;
    }

    VariableDeclaration(const Identifier &type, Identifier &id, Expression *assignexp) :
            type(type), id(id), assignexp(assignexp) {}
    VariableDeclaration(const Identifier &type, Identifier &id, int size):
            type(type), id(id), size(size) {}

    virtual llvm::Value *CodeGen(CodeGenContext &ctx) override;
};

class FunctionDeclaration : public Statement {
public:
    const Identifier &type;
    const Identifier &id;
    VariableList &args;
    Block &block;

    FunctionDeclaration(const Identifier &type, const Identifier &id,
                        VariableList &args, Block &block) :
            type(type), id(id), args(args), block(block) {
        std::cout<<"function declaration: "<<type.name<<" "<<id.name<<std::endl;
    }

    virtual llvm::Value *CodeGen(CodeGenContext &ctx) override;
};

class IfStatement : public Statement {
public:
    Expression *_cond;
    Block *_then;
    Block *_else;

    IfStatement(Expression *_cond, Block *_then, Block *_else = nullptr) :
            _cond(_cond), _then(_then), _else(_else) {}

    virtual llvm::Value *CodeGen(CodeGenContext &ctx) override;
};

class WhileStatement : public Statement {
public:
    Expression *_cond;
    Block *_loop;

    WhileStatement(Expression *_cond, Block *_loop) :
            _cond(_cond), _loop(_loop) {}

    virtual llvm::Value *CodeGen(CodeGenContext &ctx) override;

};

class BreakStatement : public Statement {
public:
    BreakStatement(void) {
        std::cout<<"break"<<std::endl;
    }

    virtual llvm::Value *CodeGen(CodeGenContext &ctx) override;
};

class ReturnStatement : public Statement {
public:
    Expression *_ret;

    ReturnStatement(Expression *_ret = nullptr) :
            _ret(_ret) {
        std::cout<<"return"<<std::endl;
    }

    virtual llvm::Value *CodeGen(CodeGenContext &ctx) override;
};

class ExpressionStatement : public Statement {
public:
    Expression &exp;
    ExpressionStatement(Expression &exp) : exp(exp) {}
    virtual llvm::Value *CodeGen(CodeGenContext &ctx) override;
};

class Address : public Expression {
public:
    Identifier &id;
    Address(Identifier& id) : id(id){}
    virtual llvm::Value *CodeGen(CodeGenContext &ctx) override;
};

class Array : public Expression {
public:
    Identifier &id;
    Expression &exp;
    Array(Identifier& id, Expression& exp): id(id), exp(exp){}
    virtual llvm::Value* CodeGen(CodeGenContext &ctx) override;
};

class ArrayAssignment : public Expression {
public:
    Identifier& id;
    Expression& _index;
    Expression& _exp;
    ArrayAssignment(Identifier& id, Expression& _index, Expression& _exp) :
            id(id), _index(_index), _exp(_exp) {}
    virtual llvm::Value* CodeGen(CodeGenContext& ctx) override;

};

#endif