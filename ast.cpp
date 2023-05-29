#include "codegen.hpp"
#include "parser.hpp"
#include "utils.cpp"

using namespace llvm;

Value *Integer::CodeGen(CodeGenContext &ctx) {
    std::cout << "Integer : " << value << std::endl;
    return ConstantInt::get(Type::getInt32Ty(global_ctx), value, true);
}

Value *Double::CodeGen(CodeGenContext &ctx) {
    std::cout << "Double :" << value << std::endl;
    return ConstantFP::get(Type::getDoubleTy(global_ctx), value);
}

Value *Char::CodeGen(CodeGenContext &ctx) {
    std::cout << "Char : " << value << std::endl;
    return builder.getInt8(value);
}

Value *String::CodeGen(CodeGenContext &ctx) {
    std::cout << "String : " << value << std::endl;

    // first we need to deal with \n
    // which is regarded with two characters for input
    int pos=value.find("\\n");
    std::string rep = std::string(1,'\n');
    while(pos!=std::string::npos){
        value = value.replace(pos, 2,rep);
        pos = value.find("\\n");
    }
    Constant* const_str = ConstantDataArray::getString(global_ctx, value);
    Value* global_var = new GlobalVariable(*(ctx.module), const_str->getType(), true, \
                                            GlobalValue::PrivateLinkage, const_str, "_Const_String_");
    std::vector<Value*> index_space;
    index_space.push_back(builder.getInt32(0));
    index_space.push_back(builder.getInt32(0));
    Value* var_ptr = builder.CreateInBoundsGEP(global_var->getType()->getPointerElementType(), \
                                                global_var, ArrayRef<Value*>(index_space), \
                                                "tmpString");
    return var_ptr;
}

Value *Identifier::CodeGen(CodeGenContext &ctx) {
    std::cout << "Identifier : " << name << std::endl;
    // find the variable in the symbol table of current context
    Value *var = ctx.find_var(name);
    if (var == nullptr) {
        throw std::logic_error("undeclared variable!" + name +"\n");
    }

    Type* type = var->getType()->getPointerElementType();
    llvm::outs()<<"identifier type:"<<*type;
    std::cout<<std::endl;

    Value* res = nullptr;

    // if the identifier is an array
    if (type->isArrayTy())
        res = builder.CreateInBoundsGEP(type, var,
                                        {builder.getInt32(0), builder.getInt32(0)},
                                        "arrayPtr");
    else
        res = new LoadInst(type, var, "LoadInst", false, builder.GetInsertBlock());
    return res;
}

Value* BinaryOperate::CodeGen(CodeGenContext &ctx) {
    std::cout << "Binary Operator : " << op << std::endl;
    Value* left = lhs.CodeGen(ctx);
    Value* right = rhs.CodeGen(ctx);
    Instruction::BinaryOps bop_inst;
    if (op== PLUS || op==MINUS || op==MUL || op==DIV || op==MOD) {
        if (left->getType() != right->getType()) {
            if(left->getType()==Type::getInt8Ty(global_ctx) && right->getType()==Type::getInt32Ty(global_ctx)) {
                printf("there\n");
                left = type_convert(left, Type::getInt32Ty(global_ctx));
            }
            else if(right->getType()==Type::getInt8Ty(global_ctx) &&  left->getType()==Type::getInt32Ty(global_ctx))
                right =type_convert(right,Type::getInt32Ty(global_ctx));
            else
                throw std::logic_error("data type not consistent for binary operation!");
        }

        bool is_double = left->getType()->isDoubleTy();

        switch (op) {
            case PLUS:
                if (is_double)
                    return builder.CreateFAdd(left, right);
                else
                    return builder.CreateAdd(left, right);
            case MINUS:
                if (is_double)
                    return builder.CreateFSub(left, right);
                else
                    return builder.CreateSub(left, right);
            case MUL:
                if (is_double)
                    return builder.CreateFMul(left, right);
                else
                    return builder.CreateMul(left, right);
            case DIV:
                if (is_double)
                    return builder.CreateFDiv(left, right);
                else
                    return builder.CreateSDiv(left, right);
            case MOD:
                if (is_double)
                    return builder.CreateFRem(left, right);
                else
                    return builder.CreateSRem(left, right);
            default:
                return nullptr;
        }}
    else if(op==LT || op==LE || op==GT || op==GE || op==EQ ||op==NEQ){
        if(left->getType() != right->getType()){
            if(left->getType()==Type::getInt8Ty(global_ctx) && right->getType()==Type::getInt32Ty(global_ctx))
                left = type_convert(left,Type::getInt8Ty(global_ctx));
            else if(right->getType()==Type::getInt8Ty(global_ctx) &&  left->getType()==Type::getInt32Ty(global_ctx))
                right =type_convert(right,Type::getInt8Ty(global_ctx));
            else
                throw std::logic_error("data type not consistent for binary operation!");
        }
        bool is_double = left->getType()==Type::getFloatTy((global_ctx));
        switch(op){
            case LT:
                if (is_double)
                    return builder.CreateFCmpOLT(left, right);
                else
                    return builder.CreateICmpSLT(left, right);
            case LE:
                if (is_double)
                    return builder.CreateFCmpOLE(left, right);
                else
                    return builder.CreateICmpSLT(left, right);
            case GT:
                if (is_double)
                    return builder.CreateFCmpOGT(left, right);
                else
                    return builder.CreateICmpSGT(left, right);
            case GE:
                if (is_double)
                    return builder.CreateFCmpOGE(left, right);
                else
                    return builder.CreateICmpSGE(left, right);
            case EQ:
                if (is_double)
                    return builder.CreateFCmpOEQ(left, right);
                else
                    return builder.CreateICmpEQ(left, right);
            case NEQ:
                if (is_double)
                    return builder.CreateFCmpONE(left, right);
                else
                    return builder.CreateICmpNE(left, right);
            default:
                return nullptr;
        }
    }
    else
        throw std::logic_error("undefined binary operator!\n");
}

Value* Assignment::CodeGen(CodeGenContext &ctx) {
    std::cout << "Assignment, lhs"<< lhs.name << std::endl;

    // find the identifier in the symbol stack
    Value* res = ctx.find_var(lhs.name);
    if (res==nullptr)
        throw std::logic_error("undeclared variable "+lhs.name+" \n");

    Value* right=rhs.CodeGen(ctx);
    if (right->getType() != res->getType()->getPointerElementType())
        throw std::logic_error("assignment type not match!\n");

    return builder.CreateStore(right, res);
}

Value* Block::CodeGen(CodeGenContext &ctx) {
    Value* res=NULL;
    auto ite=statements.begin();
    for(; ite!=statements.end(); ite++)
        std::cout << "Block Generating Type: " << typeid(**ite).name()<< std::endl;
    ite=statements.begin();
    for(; ite!=statements.end(); ite++){
        std::cout << "Block Generating: " << typeid(**ite).name()<< std::endl;
        res=(*ite)->CodeGen(ctx);
        if (ctx.has_return == true)
            break;
    }
    return res;
}

Value* FunctionCall::CodeGen(CodeGenContext &ctx) {

    // printf function
    std::cout<<"function call name: "<<id.name<<std::endl;
    if (id.name=="printf"){
        return printf_gen(ctx, args);
    }
    else if (id.name=="scanf"){
        return scanf_gen(ctx, args);
    }

    // check function in the context
    Function* func = ctx.module->getFunction(id.name.c_str());
    if (func==NULL)
        throw std::logic_error("cannot find function: "+id.name+" \n");

    // calculate arg value of the passing parameters
    std::vector<Value*> args_list;
    auto func_arg = func->arg_begin();
    for (auto ite : args) {
        auto val=(*ite).CodeGen(ctx);
        if(val->getType()!=func_arg->getType()){
            throw std::logic_error("function arg type not match\n");
        }
        func_arg++;
        args_list.push_back(val);
    }

    CallInst* call = CallInst::Create(func, makeArrayRef(args_list), id.name, builder.GetInsertBlock());
    std::cout << "function call "<<id.name<<std::endl;
    return call;
}

// variable declaration for function and global are all in there
Value* VariableDeclaration::CodeGen(CodeGenContext &ctx){
    int is_array = size>0;
    // type of the variable
    Type* llvm_type=get_type(type.name, is_array, size);

    // if it's global variable
    if (ctx.cur_f == nullptr){
        std::cout << "create global variable "<< type.name << std::endl;
        Value* exist=ctx.module->getGlobalVariable(id.name, true);
        if (exist)
            throw std::logic_error("Global Variable has been defined: "+id.name);
        GlobalVariable* var = new GlobalVariable(*(ctx.module), llvm_type, false, \
                                                GlobalValue::PrivateLinkage, 0, id.name);
        if (!is_array)
            var->setInitializer(ConstantInt::get(llvm_type, 0));
        else{
            std::vector<Constant*> array;
            Constant* elem = ConstantInt::get((ArrayType*)llvm_type->getArrayElementType(), 0);
            for (int i=0; i<size; i++)
                array.push_back(elem);
            Constant* ar = ConstantArray::get(ArrayType::get(llvm_type->getArrayElementType(),
                                                             llvm_type->getArrayNumElements()),
                                                             array);
            var->setInitializer(ar);
            std::cout<<" create array" << type.name<<  std::endl;
        }
        return nullptr;
    }
    // the variable is not a global variable
    else{
        if (ctx.get_sym_tab().count(id.name)!=0)
            throw std::logic_error("Local variable has been defined! "+ id.name);
        std::cout << "create local variable "<< type.name << std::endl;
        auto *blk = builder.GetInsertBlock();
        AllocaInst *inst = new AllocaInst(llvm_type, blk->getParent()->getParent()->getDataLayout().getAllocaAddrSpace(),
                                          id.name.c_str(), blk);

        // insert the newly defined variables into the symbol table
        ctx.get_sym_tab()[id.name] = inst;
        std::cout<<ctx.get_sym_tab()[id.name]<<std::endl;

        if(assignexp!=NULL){
            Assignment asgn(id, *assignexp);
            asgn.CodeGen(ctx);
        }

        return inst;
    }
}

Value* FunctionDeclaration::CodeGen(CodeGenContext &ctx) {
    std::vector<Type*> arg_type;
    for (auto ite : args){
        bool is_array = ite->size!=0;
        arg_type.push_back(get_type(ite->type.name, is_array, ite->size));
    }

    FunctionType* func_type = FunctionType::get(get_type(type.name, false), makeArrayRef(arg_type), false);
    Function* func = Function::Create(func_type, GlobalValue::ExternalLinkage, id.name.c_str(), ctx.module);
    BasicBlock* func_bb = BasicBlock::Create(global_ctx, "entry", func, 0);
    BasicBlock* ret_bb = BasicBlock::Create(global_ctx, "return", func, 0);
    ctx.ret_bb = ret_bb;

    if (type.name!="void")
         ctx.ret_val = new AllocaInst(get_type(type.name, false),
                                func_bb->getParent()->getParent()->getDataLayout().getAllocaAddrSpace(),
                                "", func_bb);

    Value* arg_val;

    // push table to store arguments of the function
    Function::arg_iterator arg_ite = func->arg_begin();

    ctx.push_block();
    ctx.cur_f = func;
    builder.SetInsertPoint(func_bb);

    for(auto ite : args){
        (*ite).CodeGen(ctx);
        arg_val = &*(arg_ite++);
        arg_val->setName(ite->id.name.c_str());
        StoreInst* inst = new StoreInst(arg_val, ctx.get_sym_tab()[ite->id.name], false, func_bb);
    }
    block.CodeGen(ctx);
    builder.SetInsertPoint(ret_bb);
    ctx.has_return = false;

    if(type.name == "void") {
        builder.CreateRetVoid();
    } else {
        if(ctx.ret_val== nullptr){
            throw std::logic_error("return is needed for non void function!\n");
        }
        Value* ret = builder.CreateLoad(get_type(type.name, false), ctx.ret_val, "");
        builder.CreateRet(ret);
    }
    ctx.pop_block();
    ctx.cur_f = nullptr;
    return nullptr;
}

Value* IfStatement::CodeGen(CodeGenContext &ctx) {
    std::cout << "If statement" << std::endl;

    Function* func = ctx.cur_f;

    BasicBlock* then_bb = BasicBlock::Create(global_ctx, "if", func);
    BasicBlock* else_bb = BasicBlock::Create(global_ctx, "else", func);
    BasicBlock* merge_bb = BasicBlock::Create(global_ctx, "merge", func);

    Value* cond = _cond->CodeGen(ctx);
    cond = builder.CreateICmpNE(cond, ConstantInt::get(Type::getInt1Ty(global_ctx), 0, true), "ifcond");
    auto br = builder.CreateCondBr(cond, then_bb, else_bb);

    builder.SetInsertPoint(then_bb);
    ctx.push_block();
    _then->CodeGen(ctx);
    ctx.pop_block();

    // contain return in else
    // has_return is dealed in declaration
    if(ctx.has_return)
        ctx.has_return=false;
    else
        builder.CreateBr(merge_bb);

    builder.SetInsertPoint(else_bb);

    if (_else!=nullptr){
        ctx.push_block();
        _else->CodeGen(ctx);
        ctx.pop_block();

        if (ctx.has_return)
            ctx.has_return=false;
        else
            builder.CreateBr(merge_bb);
    }
    builder.SetInsertPoint(merge_bb);
    return nullptr;
}

Value* ReturnStatement::CodeGen(CodeGenContext &ctx) {
    // std::cout<<"return "
    std::cout << "Return "<<std::endl;
    if (_ret==nullptr){
        if(ctx.cur_f->getReturnType()->isVoidTy())
            ;
        else
            throw std::logic_error("expected return value for non void function!");
    }
    else {
        std::cout << "return expression: " << typeid(*_ret).name()<< std::endl;
        Value *ret = _ret->CodeGen(ctx);
        if (ret->getType() != ctx.cur_f->getReturnType())
            throw std::logic_error("type of return value must match the function type!");
        builder.CreateStore(ret, ctx.ret_val);
    }
    ctx.has_return=true;
    return builder.CreateBr(ctx.ret_bb);
}

Value* WhileStatement::CodeGen(CodeGenContext &ctx) {
    std::cout<<"while statement"<<std::endl;

    Function* func = ctx.cur_f;

    BasicBlock* cond_bb = BasicBlock::Create(global_ctx, "while_cond", func);
    BasicBlock* loop_bb = BasicBlock::Create(global_ctx, "while_loop", func);
    BasicBlock* end_bb = BasicBlock::Create(global_ctx, "while_end", func);

    builder.CreateBr(cond_bb);
    builder.SetInsertPoint(cond_bb);

    Value* cond = _cond->CodeGen(ctx);
    cond = builder.CreateICmpNE(cond, ConstantInt::get(Type::getInt1Ty(global_ctx), 0, true), "while_cond");
    auto branch = builder.CreateCondBr(cond, loop_bb, end_bb);
    cond_bb = builder.GetInsertBlock();

    builder.SetInsertPoint(loop_bb);
    ctx.push_block();
    _loop->CodeGen(ctx);
    ctx.pop_block();
    ctx.pop_break();

    if(ctx.has_return)
        ctx.has_return = false;
    else
        builder.CreateBr(cond_bb);

    builder.SetInsertPoint(end_bb);

    return branch;
}

Value* BreakStatement::CodeGen(CodeGenContext &ctx) {
    ctx.has_return = true;
    BasicBlock* break_bb = ctx.get_break();
    if (break_bb)
        builder.CreateBr(break_bb);
    else
        throw std::logic_error("break should be used in loops!");
    return nullptr;
}

Value* ExpressionStatement::CodeGen(CodeGenContext &ctx) {
    std::cout << "Expression Statement: " << typeid(exp).name()<< std::endl;
    return exp.CodeGen(ctx);
}

Value* Address::CodeGen(CodeGenContext &ctx) {
    std::cout << "Get Address of identifier "<<id.name<<std::endl;
    Value* res = ctx.find_var(id.name);
    if(res==nullptr)
        throw std::logic_error("undeclared variable "+id.name+" \n");
    else
        return res;
}

Value* Array::CodeGen(CodeGenContext &ctx) {
    std::cout << "Array: "<< id.name << std::endl;
    Value* val = ctx.find_var(id.name);
    if (val==nullptr)
        throw std::logic_error("identifier "+id.name+" not declared!\n");
    Value* idx = exp.CodeGen(ctx);
    std::vector<Value*> idx_list;
    idx_list.push_back(builder.getInt32(0));
    idx_list.push_back(idx);
    Value* ptr = builder.CreateInBoundsGEP(val->getType()->getPointerElementType(), val,
                                           ArrayRef<Value*>(idx_list), "tmparray");
    return builder.CreateLoad(ptr->getType()->getPointerElementType(), ptr, "tmpvar");
}

Value* ArrayAssignment::CodeGen(CodeGenContext &ctx) {
    std::cout<<"array assignment: "<< id.name<< std::endl;
    Value* val = ctx.find_var(id.name);
    if (val==nullptr)
        throw std::logic_error("undeclared array!\n");
    Value* idx = _index.CodeGen(ctx);
    std::vector<Value*> idx_list;
    idx_list.push_back(builder.getInt32(0));
    idx_list.push_back(idx);
    // get the value of the array element
    Value* lhs = builder.CreateInBoundsGEP(val->getType()->getPointerElementType(), val,
                                           ArrayRef<Value* >(idx_list), "tmparray");
    std::cout<<typeid(_exp).name()<<std::endl;
    Value* rhs = _exp.CodeGen(ctx);
    if(rhs->getType()!=lhs->getType()->getPointerElementType())
        throw std::logic_error("assignment type not match!\n");
    builder.CreateStore(rhs, lhs);
    printf("created array store!\n");
    return nullptr;
}