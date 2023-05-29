Basic Block in function 'g' does not have terminator!
label %entry
; ModuleID = 'main'
source_filename = "main"

@_Const_String_ = private constant [4 x i8] c"%c\0A\00"
@_Const_String_.1 = private constant [3 x i8] c"%c\00"

declare i32 @printf(i8*, ...)

declare i32 @scanf(...)

define i32 @g(i8 %x1) {
entry:
  %0 = alloca i32, align 4
  %x = alloca i8, align 1
  store i8 %x1, i8* %x, align 1
  %LoadInst = load i8, i8* %x, align 1
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_Const_String_, i32 0, i32 0), i8 %LoadInst)

return:                                           ; No predecessors!
  %1 = load i32, i32* %0, align 4
  ret i32 %1
}

define i32 @main() {
entry:
  %0 = alloca i32, align 4
  %a = alloca i8, align 1
  %c = alloca i32, align 4
  store i32 1, i32* %c, align 4
  %scanf = call i32 (...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_Const_String_.1, i32 0, i32 0), i8* %a)
  %LoadInst = load i8, i8* %a, align 1
  %g = call i32 @g(i8 %LoadInst)
  store i32 0, i32* %0, align 4
  br label %return

return:                                           ; preds = %entry
  %1 = load i32, i32* %0, align 4
  ret i32 %1
}
