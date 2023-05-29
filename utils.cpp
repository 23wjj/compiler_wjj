#include "ast.hpp"
#include "codegen.hpp"

using namespace llvm;
Instruction::CastOps type_inst(Type* src, Type* dst){
    if(src==Type::getInt8Ty(global_ctx) && dst==Type::getInt32Ty(global_ctx))
        return Instruction::ZExt;
    throw std::logic_error("Wrong typecast");
}

Value* type_convert(Value* src, Type* dst){
    Instruction::CastOps op = type_inst(src->getType(), dst);
    return builder.CreateCast(op, src, dst, "typeconvert");
}
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


Value* printf_gen(CodeGenContext &ctx, ExpressionList args){
    std::vector<Value*> *printf_args = new std::vector<Value*>;
    for(auto ite: args){
        Value* tmp = ite->CodeGen(ctx);
        if (tmp->getType() == Type::getFloatTy(global_ctx))
            tmp = builder.CreateFPExt(tmp, Type::getDoubleTy(global_ctx), "tmpdouble");
        if (tmp!=nullptr)
            printf_args->push_back(tmp);
    }
    Function* printf = ctx.printf;
    return builder.CreateCall(printf, *printf_args, "printf");
}

Value* scanf_gen(CodeGenContext &ctx, ExpressionList args){
    std::vector<Value*> *scanf_args = new std::vector<Value*>;
    for(auto ite: args){
        Value* tmp = ite->CodeGen(ctx);
        scanf_args->push_back(tmp);
    }
    Function* scanf = ctx.scanf;
    return builder.CreateCall(scanf, *scanf_args, "scanf");
}
