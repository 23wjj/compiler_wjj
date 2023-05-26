
#include "codegen.hpp"

llvm::LLVMContext global_ctx;
llvm::IRBuilder<> builder(global_ctx);

void CodeGenContext::gen_code(Block* root){
    root->CodeGen(*this);
    std::error_code EC;
    llvm::StringRef sr(filename);
    llvm::raw_fd_ostream Out(sr, EC);
    verifyModule(*module, &Out);
    module->print(Out, nullptr);
}

llvm::BasicBlock* CodeGenContext::get_break(){
    if(break_stack.size())
        return break_stack.back();
    else
        return nullptr;
}

void CodeGenContext::insert_break(llvm::BasicBlock* break_bb){
    break_stack.push_back(break_bb);
}

void CodeGenContext::pop_break(){
    if(break_stack.size()==0)
        return;
    break_stack.pop_back();
}

llvm::Function* CodeGenContext::printf_prototype(){
    std::vector<llvm::Type*> printf_arg_types;
    printf_arg_types.push_back(builder.getInt8PtrTy());

    llvm::FunctionType* printf_type = llvm::FunctionType::get(builder.getInt32Ty(),
                                                  printf_arg_types,
                                                  true);

    llvm::Function *func = llvm::Function::Create(
            printf_type, llvm::Function::ExternalLinkage,
            llvm::Twine("printf"),
            module
    );
    func->setCallingConv(llvm::CallingConv::C);
    return func;
}

llvm::Function* CodeGenContext::scanf_prototype(){
    llvm::FunctionType* scanf_type = llvm::FunctionType::get(builder.getInt32Ty(), true);
    llvm::Function *func = llvm::Function::Create(
            scanf_type, llvm::Function::ExternalLinkage,
            llvm::Twine("scanf"),
            module
    );
    func->setCallingConv(llvm::CallingConv::C);
    return func;
}

