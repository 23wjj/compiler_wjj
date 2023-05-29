#include <stack>
#include <map>
#include <string>
#include <llvm/IR/Function.h>
#include <llvm/IR/Type.h>
#include <llvm/IR/LLVMContext.h>                   // public data structure
#include <llvm/IR/IRBuilder.h>                      // generator of instructions
#include <llvm/IR/Verifier.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/ADT/StringRef.h>

#include "ast.hpp"

extern llvm::LLVMContext global_ctx;
extern llvm::IRBuilder<> builder;

class CodeGenBlock {
public:
    std::map<std::string, llvm::Value *> sym_tab; // symbol table for local variables
};

class CodeGenContext {

    std::vector<CodeGenBlock *> symbol_stack; // symbol table stack


public:

    llvm::Module *module; // store all functions and global variables
    llvm::Function *cur_f; // indicate the current function
    bool has_return; // indicate whether there has already been a return statement in certain block
    llvm::Value* ret_val=nullptr; //record the return value
    std::vector<llvm::BasicBlock*> break_stack; // record the start place of certain block containing break
    std::string filename; // the target file to store the generated llvm IR representation
    llvm::BasicBlock* ret_bb; // return block of a function
    llvm::Function* printf; // printf function prototype
    llvm::Function* scanf;  // scanf function prototype

    CodeGenContext(std::string filename): filename(filename) {
        module = new llvm::Module("main", global_ctx);
        has_return = false;
        printf = printf_prototype();
        scanf = scanf_prototype();
    }

    void gen_code(Block *root);

    std::map<std::string, llvm::Value *> &get_sym_tab() {
        return symbol_stack.back()->sym_tab;
    }

    void push_block() {
        CodeGenBlock *blk = new CodeGenBlock();
        symbol_stack.push_back(blk);
    }

    void pop_block() {
        CodeGenBlock *top = symbol_stack.back();
        symbol_stack.pop_back();
        delete top;
    }

    llvm::Value *find_var(std::string var_name) {

        // find local variables in the symbol stack
        std::vector<CodeGenBlock *>::reverse_iterator ite = symbol_stack.rbegin();
        for (; ite != symbol_stack.rend(); ite++) {
            CodeGenBlock *cur = *ite;
            if (cur->sym_tab.find(var_name) != cur->sym_tab.end())
                return cur->sym_tab[var_name];

        }

        // find global variables in the global symbol table
        return module->getGlobalVariable(var_name, true);
    }
    llvm::Function* scanf_prototype();
    llvm::Function* printf_prototype();
    llvm::BasicBlock* get_break();

    void pop_break();

    void insert_break(llvm::BasicBlock*);

};
