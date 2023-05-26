#include <iostream>
#include "codegen.hpp"

extern int yyparse();
extern Block* root;

int main() {
    std::string filename="test.ll";
    printf("here!\n");
    yyparse();
    printf("#################################\n");
    printf("parsing done!\n");
    auto gen = new CodeGenContext(filename);
    gen->gen_code(root);
    return 0;
}
