#include <llvm/IR/BasicBlock.h>
#include <llvm/ADT/ArrayRef.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/InstrTypes.h>
#include <llvm/IR/Instruction.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Type.h>
#include <llvm/IR/Value.h>
#include <string>
#include "codegen.hpp"
#include "ast.hpp"
using namespace llvm;

Type* get_type(std::string type, bool is_array, int array_size=0){
    if (is_array){
        if (type=="int")
            return ArrayType::get(Type::getInt32Ty(global_ctx), array_size);
        else if (type=="double")
            return ArrayType::get(Type::getDoubleTy(global_ctx), array_size);
        else if (type=="char")
            return ArrayType::get(Type::getInt8Ty(global_ctx), array_size);
        else
            throw std::logic_error("Type "+type+" not defined!\n");
    }
    else{
        if(type=="int")
            return Type::getInt32Ty(global_ctx);
        else if (type=="double")
            return Type::getDoubleTy(global_ctx);
        else if (type=="char")
            return Type::getInt8Ty(global_ctx);
        else
            throw std::logic_error("Type "+type+" not defined!\n");
    }
    return nullptr;
}
Function* printf_prototype(CodeGenContext &ctx){
    std::vector<Type*> printf_arg_types;
    printf_arg_types.push_back(builder.getInt8PtrTy());

    FunctionType* printf_type = FunctionType::get(builder.getInt32Ty(),
                                                  printf_arg_types,
                                                  true);

    Function *func = Function::Create(
            printf_type, Function::ExternalLinkage,
            Twine("printf"),
            ctx.module
    );
    func->setCallingConv(llvm::CallingConv::C);
    return func;
}

Function* scanf_prototype(CodeGenContext &ctx){
    FunctionType* scanf_type = FunctionType::get(builder.getInt32Ty(), true);
    Function *func = Function::Create(
            scanf_type, Function::ExternalLinkage,
            Twine("scanf"),
            ctx.module
    );
    func->setCallingConv(llvm::CallingConv::C);
    return func;
}


Value* printf_gen(CodeGenContext &ctx, ExpressionList args){
    std::vector<Value*> *printf_args = new std::vector<Value*>;
    for(auto ite: args){
        Value* tmp = ite->CodeGen(ctx);
        if (tmp->getType() == Type::getFloatTy(global_ctx))
            tmp = builder.CreateFPExt(tmp, Type::getDoubleTy(global_ctx), "tmpdouble");
        if (tmp!=nullptr)
            printf_args->push_back(tmp);
    }
    Function* printf = printf_prototype(ctx);
    return builder.CreateCall(printf, *printf_args, "printf");
}

Value* scanf_gen(CodeGenContext &ctx, ExpressionList args){
    std::vector<Value*> *scanf_args = new std::vector<Value*>;
    for(auto ite: args){
        Value* tmp = ite->CodeGen(ctx);
        scanf_args->push_back(tmp);
    }
    Function* scanf = scanf_prototype(ctx);
    return builder.CreateCall(scanf, *scanf_args, "scanf");
}

