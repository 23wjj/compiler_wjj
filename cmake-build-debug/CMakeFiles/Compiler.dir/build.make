# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


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
CMAKE_BINARY_DIR = /mnt/e/compiler_wjj/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/Compiler.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/Compiler.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Compiler.dir/flags.make

CMakeFiles/Compiler.dir/main.cpp.o: CMakeFiles/Compiler.dir/flags.make
CMakeFiles/Compiler.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/e/compiler_wjj/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/Compiler.dir/main.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Compiler.dir/main.cpp.o -c /mnt/e/compiler_wjj/main.cpp

CMakeFiles/Compiler.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Compiler.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/e/compiler_wjj/main.cpp > CMakeFiles/Compiler.dir/main.cpp.i

CMakeFiles/Compiler.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Compiler.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/e/compiler_wjj/main.cpp -o CMakeFiles/Compiler.dir/main.cpp.s

CMakeFiles/Compiler.dir/codegen.cpp.o: CMakeFiles/Compiler.dir/flags.make
CMakeFiles/Compiler.dir/codegen.cpp.o: ../codegen.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/e/compiler_wjj/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/Compiler.dir/codegen.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Compiler.dir/codegen.cpp.o -c /mnt/e/compiler_wjj/codegen.cpp

CMakeFiles/Compiler.dir/codegen.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Compiler.dir/codegen.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/e/compiler_wjj/codegen.cpp > CMakeFiles/Compiler.dir/codegen.cpp.i

CMakeFiles/Compiler.dir/codegen.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Compiler.dir/codegen.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/e/compiler_wjj/codegen.cpp -o CMakeFiles/Compiler.dir/codegen.cpp.s

CMakeFiles/Compiler.dir/ast.cpp.o: CMakeFiles/Compiler.dir/flags.make
CMakeFiles/Compiler.dir/ast.cpp.o: ../ast.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/e/compiler_wjj/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/Compiler.dir/ast.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Compiler.dir/ast.cpp.o -c /mnt/e/compiler_wjj/ast.cpp

CMakeFiles/Compiler.dir/ast.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Compiler.dir/ast.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/e/compiler_wjj/ast.cpp > CMakeFiles/Compiler.dir/ast.cpp.i

CMakeFiles/Compiler.dir/ast.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Compiler.dir/ast.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/e/compiler_wjj/ast.cpp -o CMakeFiles/Compiler.dir/ast.cpp.s

CMakeFiles/Compiler.dir/parser.cpp.o: CMakeFiles/Compiler.dir/flags.make
CMakeFiles/Compiler.dir/parser.cpp.o: ../parser.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/e/compiler_wjj/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/Compiler.dir/parser.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Compiler.dir/parser.cpp.o -c /mnt/e/compiler_wjj/parser.cpp

CMakeFiles/Compiler.dir/parser.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Compiler.dir/parser.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/e/compiler_wjj/parser.cpp > CMakeFiles/Compiler.dir/parser.cpp.i

CMakeFiles/Compiler.dir/parser.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Compiler.dir/parser.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/e/compiler_wjj/parser.cpp -o CMakeFiles/Compiler.dir/parser.cpp.s

CMakeFiles/Compiler.dir/lexer.cpp.o: CMakeFiles/Compiler.dir/flags.make
CMakeFiles/Compiler.dir/lexer.cpp.o: ../lexer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/e/compiler_wjj/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/Compiler.dir/lexer.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Compiler.dir/lexer.cpp.o -c /mnt/e/compiler_wjj/lexer.cpp

CMakeFiles/Compiler.dir/lexer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Compiler.dir/lexer.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/e/compiler_wjj/lexer.cpp > CMakeFiles/Compiler.dir/lexer.cpp.i

CMakeFiles/Compiler.dir/lexer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Compiler.dir/lexer.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/e/compiler_wjj/lexer.cpp -o CMakeFiles/Compiler.dir/lexer.cpp.s

# Object files for target Compiler
Compiler_OBJECTS = \
"CMakeFiles/Compiler.dir/main.cpp.o" \
"CMakeFiles/Compiler.dir/codegen.cpp.o" \
"CMakeFiles/Compiler.dir/ast.cpp.o" \
"CMakeFiles/Compiler.dir/parser.cpp.o" \
"CMakeFiles/Compiler.dir/lexer.cpp.o"

# External object files for target Compiler
Compiler_EXTERNAL_OBJECTS =

Compiler: CMakeFiles/Compiler.dir/main.cpp.o
Compiler: CMakeFiles/Compiler.dir/codegen.cpp.o
Compiler: CMakeFiles/Compiler.dir/ast.cpp.o
Compiler: CMakeFiles/Compiler.dir/parser.cpp.o
Compiler: CMakeFiles/Compiler.dir/lexer.cpp.o
Compiler: CMakeFiles/Compiler.dir/build.make
Compiler: /usr/lib/llvm-14/lib/libLLVMCore.a
Compiler: /usr/lib/llvm-14/lib/libLLVMExecutionEngine.a
Compiler: /usr/lib/llvm-14/lib/libLLVMInterpreter.a
Compiler: /usr/lib/llvm-14/lib/libLLVMMC.a
Compiler: /usr/lib/llvm-14/lib/libLLVMSupport.a
Compiler: /usr/lib/llvm-14/lib/libLLVMX86CodeGen.a
Compiler: /usr/lib/llvm-14/lib/libLLVMX86Desc.a
Compiler: /usr/lib/llvm-14/lib/libLLVMX86Info.a
Compiler: /usr/lib/llvm-14/lib/libLLVMMCJIT.a
Compiler: /usr/lib/llvm-14/lib/libLLVMAsmParser.a
Compiler: /usr/lib/llvm-14/lib/libLLVMX86AsmParser.a
Compiler: /usr/lib/x86_64-linux-gnu/libffi.so
Compiler: /usr/lib/llvm-14/lib/libLLVMAsmPrinter.a
Compiler: /usr/lib/llvm-14/lib/libLLVMDebugInfoMSF.a
Compiler: /usr/lib/llvm-14/lib/libLLVMInstrumentation.a
Compiler: /usr/lib/llvm-14/lib/libLLVMGlobalISel.a
Compiler: /usr/lib/llvm-14/lib/libLLVMSelectionDAG.a
Compiler: /usr/lib/llvm-14/lib/libLLVMCodeGen.a
Compiler: /usr/lib/llvm-14/lib/libLLVMBitWriter.a
Compiler: /usr/lib/llvm-14/lib/libLLVMScalarOpts.a
Compiler: /usr/lib/llvm-14/lib/libLLVMAggressiveInstCombine.a
Compiler: /usr/lib/llvm-14/lib/libLLVMInstCombine.a
Compiler: /usr/lib/llvm-14/lib/libLLVMTransformUtils.a
Compiler: /usr/lib/llvm-14/lib/libLLVMCFGuard.a
Compiler: /usr/lib/llvm-14/lib/libLLVMExecutionEngine.a
Compiler: /usr/lib/llvm-14/lib/libLLVMOrcTargetProcess.a
Compiler: /usr/lib/llvm-14/lib/libLLVMOrcShared.a
Compiler: /usr/lib/llvm-14/lib/libLLVMRuntimeDyld.a
Compiler: /usr/lib/llvm-14/lib/libLLVMTarget.a
Compiler: /usr/lib/llvm-14/lib/libLLVMAnalysis.a
Compiler: /usr/lib/llvm-14/lib/libLLVMProfileData.a
Compiler: /usr/lib/llvm-14/lib/libLLVMDebugInfoDWARF.a
Compiler: /usr/lib/llvm-14/lib/libLLVMObject.a
Compiler: /usr/lib/llvm-14/lib/libLLVMBitReader.a
Compiler: /usr/lib/llvm-14/lib/libLLVMTextAPI.a
Compiler: /usr/lib/llvm-14/lib/libLLVMCore.a
Compiler: /usr/lib/llvm-14/lib/libLLVMRemarks.a
Compiler: /usr/lib/llvm-14/lib/libLLVMBitstreamReader.a
Compiler: /usr/lib/llvm-14/lib/libLLVMX86Desc.a
Compiler: /usr/lib/llvm-14/lib/libLLVMMCDisassembler.a
Compiler: /usr/lib/llvm-14/lib/libLLVMX86Info.a
Compiler: /usr/lib/llvm-14/lib/libLLVMMCParser.a
Compiler: /usr/lib/llvm-14/lib/libLLVMMC.a
Compiler: /usr/lib/llvm-14/lib/libLLVMBinaryFormat.a
Compiler: /usr/lib/llvm-14/lib/libLLVMDebugInfoCodeView.a
Compiler: /usr/lib/llvm-14/lib/libLLVMSupport.a
Compiler: /usr/lib/x86_64-linux-gnu/libz.so
Compiler: /usr/lib/x86_64-linux-gnu/libtinfo.so
Compiler: /usr/lib/llvm-14/lib/libLLVMDemangle.a
Compiler: CMakeFiles/Compiler.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/mnt/e/compiler_wjj/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Linking CXX executable Compiler"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Compiler.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Compiler.dir/build: Compiler

.PHONY : CMakeFiles/Compiler.dir/build

CMakeFiles/Compiler.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/Compiler.dir/cmake_clean.cmake
.PHONY : CMakeFiles/Compiler.dir/clean

CMakeFiles/Compiler.dir/depend:
	cd /mnt/e/compiler_wjj/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /mnt/e/compiler_wjj /mnt/e/compiler_wjj /mnt/e/compiler_wjj/cmake-build-debug /mnt/e/compiler_wjj/cmake-build-debug /mnt/e/compiler_wjj/cmake-build-debug/CMakeFiles/Compiler.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/Compiler.dir/depend

