llvm-as-10 test.ll
llc-10 test.bc
clang-10 -c test.s
clang-10 test.o -o test
./test