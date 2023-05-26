# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Default target executed when no arguments are given to make.
default_target: all

.PHONY : default_target

# Allow only one "make -f Makefile2" at a time, but pass parallelism.
.NOTPARALLEL:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /mnt/e/compiler_wjj

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /mnt/e/compiler_wjj

#=============================================================================
# Targets provided globally by CMake.

# Special rule for the target rebuild_cache
rebuild_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake to regenerate build system..."
	/usr/bin/cmake -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : rebuild_cache

# Special rule for the target rebuild_cache
rebuild_cache/fast: rebuild_cache

.PHONY : rebuild_cache/fast

# Special rule for the target edit_cache
edit_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "No interactive CMake dialog available..."
	/usr/bin/cmake -E echo No\ interactive\ CMake\ dialog\ available.
.PHONY : edit_cache

# Special rule for the target edit_cache
edit_cache/fast: edit_cache

.PHONY : edit_cache/fast

# The main all target
all: cmake_check_build_system
	$(CMAKE_COMMAND) -E cmake_progress_start /mnt/e/compiler_wjj/CMakeFiles /mnt/e/compiler_wjj/CMakeFiles/progress.marks
	$(MAKE) -f CMakeFiles/Makefile2 all
	$(CMAKE_COMMAND) -E cmake_progress_start /mnt/e/compiler_wjj/CMakeFiles 0
.PHONY : all

# The main clean target
clean:
	$(MAKE) -f CMakeFiles/Makefile2 clean
.PHONY : clean

# The main clean target
clean/fast: clean

.PHONY : clean/fast

# Prepare targets for installation.
preinstall: all
	$(MAKE) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall

# Prepare targets for installation.
preinstall/fast:
	$(MAKE) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall/fast

# clear depends
depend:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 1
.PHONY : depend

#=============================================================================
# Target rules for targets named Compiler

# Build rule for target.
Compiler: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 Compiler
.PHONY : Compiler

# fast build rule for target.
Compiler/fast:
	$(MAKE) -f CMakeFiles/Compiler.dir/build.make CMakeFiles/Compiler.dir/build
.PHONY : Compiler/fast

#=============================================================================
# Target rules for targets named acc_gen

# Build rule for target.
acc_gen: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 acc_gen
.PHONY : acc_gen

# fast build rule for target.
acc_gen/fast:
	$(MAKE) -f CMakeFiles/acc_gen.dir/build.make CMakeFiles/acc_gen.dir/build
.PHONY : acc_gen/fast

#=============================================================================
# Target rules for targets named omp_gen

# Build rule for target.
omp_gen: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 omp_gen
.PHONY : omp_gen

# fast build rule for target.
omp_gen/fast:
	$(MAKE) -f CMakeFiles/omp_gen.dir/build.make CMakeFiles/omp_gen.dir/build
.PHONY : omp_gen/fast

#=============================================================================
# Target rules for targets named intrinsics_gen

# Build rule for target.
intrinsics_gen: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 intrinsics_gen
.PHONY : intrinsics_gen

# fast build rule for target.
intrinsics_gen/fast:
	$(MAKE) -f CMakeFiles/intrinsics_gen.dir/build.make CMakeFiles/intrinsics_gen.dir/build
.PHONY : intrinsics_gen/fast

ast.o: ast.cpp.o

.PHONY : ast.o

# target to build an object file
ast.cpp.o:
	$(MAKE) -f CMakeFiles/Compiler.dir/build.make CMakeFiles/Compiler.dir/ast.cpp.o
.PHONY : ast.cpp.o

ast.i: ast.cpp.i

.PHONY : ast.i

# target to preprocess a source file
ast.cpp.i:
	$(MAKE) -f CMakeFiles/Compiler.dir/build.make CMakeFiles/Compiler.dir/ast.cpp.i
.PHONY : ast.cpp.i

ast.s: ast.cpp.s

.PHONY : ast.s

# target to generate assembly for a file
ast.cpp.s:
	$(MAKE) -f CMakeFiles/Compiler.dir/build.make CMakeFiles/Compiler.dir/ast.cpp.s
.PHONY : ast.cpp.s

codegen.o: codegen.cpp.o

.PHONY : codegen.o

# target to build an object file
codegen.cpp.o:
	$(MAKE) -f CMakeFiles/Compiler.dir/build.make CMakeFiles/Compiler.dir/codegen.cpp.o
.PHONY : codegen.cpp.o

codegen.i: codegen.cpp.i

.PHONY : codegen.i

# target to preprocess a source file
codegen.cpp.i:
	$(MAKE) -f CMakeFiles/Compiler.dir/build.make CMakeFiles/Compiler.dir/codegen.cpp.i
.PHONY : codegen.cpp.i

codegen.s: codegen.cpp.s

.PHONY : codegen.s

# target to generate assembly for a file
codegen.cpp.s:
	$(MAKE) -f CMakeFiles/Compiler.dir/build.make CMakeFiles/Compiler.dir/codegen.cpp.s
.PHONY : codegen.cpp.s

lexer.o: lexer.cpp.o

.PHONY : lexer.o

# target to build an object file
lexer.cpp.o:
	$(MAKE) -f CMakeFiles/Compiler.dir/build.make CMakeFiles/Compiler.dir/lexer.cpp.o
.PHONY : lexer.cpp.o

lexer.i: lexer.cpp.i

.PHONY : lexer.i

# target to preprocess a source file
lexer.cpp.i:
	$(MAKE) -f CMakeFiles/Compiler.dir/build.make CMakeFiles/Compiler.dir/lexer.cpp.i
.PHONY : lexer.cpp.i

lexer.s: lexer.cpp.s

.PHONY : lexer.s

# target to generate assembly for a file
lexer.cpp.s:
	$(MAKE) -f CMakeFiles/Compiler.dir/build.make CMakeFiles/Compiler.dir/lexer.cpp.s
.PHONY : lexer.cpp.s

main.o: main.cpp.o

.PHONY : main.o

# target to build an object file
main.cpp.o:
	$(MAKE) -f CMakeFiles/Compiler.dir/build.make CMakeFiles/Compiler.dir/main.cpp.o
.PHONY : main.cpp.o

main.i: main.cpp.i

.PHONY : main.i

# target to preprocess a source file
main.cpp.i:
	$(MAKE) -f CMakeFiles/Compiler.dir/build.make CMakeFiles/Compiler.dir/main.cpp.i
.PHONY : main.cpp.i

main.s: main.cpp.s

.PHONY : main.s

# target to generate assembly for a file
main.cpp.s:
	$(MAKE) -f CMakeFiles/Compiler.dir/build.make CMakeFiles/Compiler.dir/main.cpp.s
.PHONY : main.cpp.s

parser.o: parser.cpp.o

.PHONY : parser.o

# target to build an object file
parser.cpp.o:
	$(MAKE) -f CMakeFiles/Compiler.dir/build.make CMakeFiles/Compiler.dir/parser.cpp.o
.PHONY : parser.cpp.o

parser.i: parser.cpp.i

.PHONY : parser.i

# target to preprocess a source file
parser.cpp.i:
	$(MAKE) -f CMakeFiles/Compiler.dir/build.make CMakeFiles/Compiler.dir/parser.cpp.i
.PHONY : parser.cpp.i

parser.s: parser.cpp.s

.PHONY : parser.s

# target to generate assembly for a file
parser.cpp.s:
	$(MAKE) -f CMakeFiles/Compiler.dir/build.make CMakeFiles/Compiler.dir/parser.cpp.s
.PHONY : parser.cpp.s

# Help Target
help:
	@echo "The following are some of the valid targets for this Makefile:"
	@echo "... all (the default if no target is provided)"
	@echo "... clean"
	@echo "... depend"
	@echo "... rebuild_cache"
	@echo "... Compiler"
	@echo "... acc_gen"
	@echo "... edit_cache"
	@echo "... omp_gen"
	@echo "... intrinsics_gen"
	@echo "... ast.o"
	@echo "... ast.i"
	@echo "... ast.s"
	@echo "... codegen.o"
	@echo "... codegen.i"
	@echo "... codegen.s"
	@echo "... lexer.o"
	@echo "... lexer.i"
	@echo "... lexer.s"
	@echo "... main.o"
	@echo "... main.i"
	@echo "... main.s"
	@echo "... parser.o"
	@echo "... parser.i"
	@echo "... parser.s"
.PHONY : help



#=============================================================================
# Special targets to cleanup operation of make.

# Special rule to run CMake to check the build system integrity.
# No rule that depends on this can have commands that come from listfiles
# because they might be regenerated.
cmake_check_build_system:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 0
.PHONY : cmake_check_build_system

