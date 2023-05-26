; ModuleID = 'main'
source_filename = "main"

@num = private global i32 0
@tmp = private global i32 0
@num_cnt = private global i32 0
@sym_cnt = private global i32 0
@num_stack = private global [15 x i32] zeroinitializer
@symbol_stack = private global [15 x i32] zeroinitializer
@num_tmp = private global [10 x i32] zeroinitializer
@cnt = private global i32 0
@p = private global i32 0
@q = private global i32 0
@cc = private global [100 x i8] zeroinitializer
@_Const_String_ = private constant [3 x i8] c"%s\00"
@_Const_String_.1 = private constant [4 x i8] c"%d\0A\00"

declare i32 @printf(i8*, ...)

declare i32 @scanf(...)

define i32 @calc() {
entry:
  %0 = alloca i32, align 4
  %i = alloca i32, align 4
  %res = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  %LoadInst = load i32, i32* @sym_cnt, align 4
  %1 = sub i32 %LoadInst, 1
  %tmparray = getelementptr inbounds [15 x i32], [15 x i32]* @symbol_stack, i32 0, i32 %1
  %tmpvar = load i32, i32* %tmparray, align 4
  store i32 %tmpvar, i32* %i, align 4
  %LoadInst1 = load i32, i32* @num_cnt, align 4
  %2 = sub i32 %LoadInst1, 2
  %tmparray2 = getelementptr inbounds [15 x i32], [15 x i32]* @num_stack, i32 0, i32 %2
  %tmpvar3 = load i32, i32* %tmparray2, align 4
  store i32 %tmpvar3, i32* @tmp, align 4
  %LoadInst4 = load i32, i32* @num_cnt, align 4
  %3 = sub i32 %LoadInst4, 1
  %tmparray5 = getelementptr inbounds [15 x i32], [15 x i32]* @num_stack, i32 0, i32 %3
  %tmpvar6 = load i32, i32* %tmparray5, align 4
  store i32 %tmpvar6, i32* %tmp2, align 4
  %LoadInst7 = load i32, i32* %i, align 4
  %4 = icmp eq i32 %LoadInst7, 43
  %ifcond = icmp ne i1 %4, false
  br i1 %ifcond, label %if, label %else

return:                                           ; preds = %merge
  %5 = load i32, i32* %0, align 4
  ret i32 %5

if:                                               ; preds = %entry
  %LoadInst8 = load i32, i32* @tmp, align 4
  %LoadInst9 = load i32, i32* %tmp2, align 4
  %6 = add i32 %LoadInst8, %LoadInst9
  store i32 %6, i32* %res, align 4
  br label %merge

else:                                             ; preds = %entry
  %LoadInst13 = load i32, i32* %i, align 4
  %7 = icmp eq i32 %LoadInst13, 45
  %ifcond14 = icmp ne i1 %7, false
  br i1 %ifcond14, label %if10, label %else11

merge:                                            ; preds = %merge12, %if
  %LoadInst31 = load i32, i32* @sym_cnt, align 4
  %8 = sub i32 %LoadInst31, 1
  store i32 %8, i32* @sym_cnt, align 4
  %LoadInst32 = load i32, i32* @num_cnt, align 4
  %9 = sub i32 %LoadInst32, 1
  store i32 %9, i32* @num_cnt, align 4
  %LoadInst33 = load i32, i32* @num_cnt, align 4
  %10 = sub i32 %LoadInst33, 1
  %tmparray34 = getelementptr inbounds [15 x i32], [15 x i32]* @num_stack, i32 0, i32 %10
  %LoadInst35 = load i32, i32* %res, align 4
  store i32 %LoadInst35, i32* %tmparray34, align 4
  store i32 0, i32* %0, align 4
  br label %return

if10:                                             ; preds = %else
  %LoadInst15 = load i32, i32* @tmp, align 4
  %LoadInst16 = load i32, i32* %tmp2, align 4
  %11 = sub i32 %LoadInst15, %LoadInst16
  store i32 %11, i32* %res, align 4
  br label %merge12

else11:                                           ; preds = %else
  %LoadInst20 = load i32, i32* %i, align 4
  %12 = icmp eq i32 %LoadInst20, 42
  %ifcond21 = icmp ne i1 %12, false
  br i1 %ifcond21, label %if17, label %else18

merge12:                                          ; preds = %merge19, %if10
  br label %merge

if17:                                             ; preds = %else11
  %LoadInst22 = load i32, i32* @tmp, align 4
  %LoadInst23 = load i32, i32* %tmp2, align 4
  %13 = mul i32 %LoadInst22, %LoadInst23
  store i32 %13, i32* %res, align 4
  br label %merge19

else18:                                           ; preds = %else11
  %LoadInst27 = load i32, i32* %i, align 4
  %14 = icmp eq i32 %LoadInst27, 47
  %ifcond28 = icmp ne i1 %14, false
  br i1 %ifcond28, label %if24, label %else25

merge19:                                          ; preds = %merge26, %if17
  br label %merge12

if24:                                             ; preds = %else18
  %LoadInst29 = load i32, i32* @tmp, align 4
  %LoadInst30 = load i32, i32* %tmp2, align 4
  %15 = sdiv i32 %LoadInst29, %LoadInst30
  store i32 %15, i32* %res, align 4
  br label %merge26

else25:                                           ; preds = %else18
  store i32 0, i32* %res, align 4
  br label %merge26

merge26:                                          ; preds = %else25, %if24
  br label %merge19
}

define i32 @calc_pri() {
entry:
  %0 = alloca i32, align 4
  %i = alloca i32, align 4
  %LoadInst = load i32, i32* @sym_cnt, align 4
  %1 = icmp eq i32 %LoadInst, 0
  %ifcond = icmp ne i1 %1, false
  br i1 %ifcond, label %if, label %else

return:                                           ; preds = %merge
  %2 = load i32, i32* %0, align 4
  ret i32 %2

if:                                               ; preds = %entry
  store i32 2, i32* @p, align 4
  %LoadInst4 = load i32, i32* @q, align 4
  %3 = icmp eq i32 %LoadInst4, 1
  %ifcond5 = icmp ne i1 %3, false
  br i1 %ifcond5, label %if1, label %else2

else:                                             ; preds = %entry
  %LoadInst6 = load i32, i32* @sym_cnt, align 4
  %4 = sub i32 %LoadInst6, 1
  %tmparray = getelementptr inbounds [15 x i32], [15 x i32]* @symbol_stack, i32 0, i32 %4
  %tmpvar = load i32, i32* %tmparray, align 4
  store i32 %tmpvar, i32* %i, align 4
  %LoadInst10 = load i32, i32* %i, align 4
  %5 = icmp eq i32 %LoadInst10, 42
  %ifcond11 = icmp ne i1 %5, false
  br i1 %ifcond11, label %if7, label %else8

merge:                                            ; preds = %merge9, %merge3
  store i32 0, i32* %0, align 4
  br label %return

if1:                                              ; preds = %if
  store i32 0, i32* @p, align 4
  br label %merge3

else2:                                            ; preds = %if
  store i32 0, i32* @tmp, align 4
  br label %merge3

merge3:                                           ; preds = %else2, %if1
  br label %merge

if7:                                              ; preds = %else
  store i32 4, i32* @p, align 4
  br label %merge9

else8:                                            ; preds = %else
  %LoadInst15 = load i32, i32* %i, align 4
  %6 = icmp eq i32 %LoadInst15, 45
  %ifcond16 = icmp ne i1 %6, false
  br i1 %ifcond16, label %if12, label %else13

merge9:                                           ; preds = %merge14, %if7
  br label %merge

if12:                                             ; preds = %else8
  store i32 4, i32* @p, align 4
  br label %merge14

else13:                                           ; preds = %else8
  store i32 3, i32* @p, align 4
  br label %merge14

merge14:                                          ; preds = %else13, %if12
  br label %merge9
}

define i32 @deal_sym() {
entry:
  %0 = alloca i32, align 4
  %LoadInst = load i32, i32* @num, align 4
  %1 = icmp eq i32 %LoadInst, 42
  %ifcond = icmp ne i1 %1, false
  br i1 %ifcond, label %if, label %else

return:                                           ; preds = %while_end
  %2 = load i32, i32* %0, align 4
  ret i32 %2

if:                                               ; preds = %entry
  store i32 4, i32* @q, align 4
  br label %merge

else:                                             ; preds = %entry
  %LoadInst4 = load i32, i32* @num, align 4
  %3 = icmp eq i32 %LoadInst4, 47
  %ifcond5 = icmp ne i1 %3, false
  br i1 %ifcond5, label %if1, label %else2

merge:                                            ; preds = %merge3, %if
  br label %while_cond

if1:                                              ; preds = %else
  store i32 4, i32* @q, align 4
  br label %merge3

else2:                                            ; preds = %else
  %LoadInst9 = load i32, i32* @num, align 4
  %4 = icmp eq i32 %LoadInst9, 10
  %ifcond10 = icmp ne i1 %4, false
  br i1 %ifcond10, label %if6, label %else7

merge3:                                           ; preds = %merge8, %if1
  br label %merge

if6:                                              ; preds = %else2
  store i32 1, i32* @q, align 4
  br label %merge8

else7:                                            ; preds = %else2
  store i32 3, i32* @q, align 4
  br label %merge8

merge8:                                           ; preds = %else7, %if6
  br label %merge3

while_cond:                                       ; preds = %while_loop, %merge
  %LoadInst11 = load i32, i32* @p, align 4
  %5 = add i32 %LoadInst11, 1
  %LoadInst12 = load i32, i32* @q, align 4
  %6 = icmp sgt i32 %5, %LoadInst12
  %while_cond13 = icmp ne i1 %6, false
  br i1 %while_cond13, label %while_loop, label %while_end

while_loop:                                       ; preds = %while_cond
  %calc = call i32 @calc()
  %calc_pri = call i32 @calc_pri()
  br label %while_cond

while_end:                                        ; preds = %while_cond
  %LoadInst14 = load i32, i32* @sym_cnt, align 4
  %tmparray = getelementptr inbounds [15 x i32], [15 x i32]* @symbol_stack, i32 0, i32 %LoadInst14
  %LoadInst15 = load i32, i32* @num, align 4
  store i32 %LoadInst15, i32* %tmparray, align 4
  %LoadInst16 = load i32, i32* @sym_cnt, align 4
  %7 = add i32 %LoadInst16, 1
  store i32 %7, i32* @sym_cnt, align 4
  %LoadInst17 = load i32, i32* @q, align 4
  store i32 %LoadInst17, i32* @p, align 4
  store i32 0, i32* %0, align 4
  br label %return
}

define i32 @calc_num() {
entry:
  %0 = alloca i32, align 4
  %res = alloca i32, align 4
  store i32 0, i32* %res, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %while_cond

return:                                           ; preds = %while_end
  %1 = load i32, i32* %0, align 4
  ret i32 %1

while_cond:                                       ; preds = %while_loop, %entry
  %LoadInst = load i32, i32* %i, align 4
  %LoadInst1 = load i32, i32* @cnt, align 4
  %2 = icmp slt i32 %LoadInst, %LoadInst1
  %while_cond2 = icmp ne i1 %2, false
  br i1 %while_cond2, label %while_loop, label %while_end

while_loop:                                       ; preds = %while_cond
  %LoadInst3 = load i32, i32* %res, align 4
  %3 = mul i32 10, %LoadInst3
  store i32 %3, i32* %res, align 4
  %LoadInst4 = load i32, i32* %res, align 4
  %LoadInst5 = load i32, i32* %i, align 4
  %tmparray = getelementptr inbounds [10 x i32], [10 x i32]* @num_tmp, i32 0, i32 %LoadInst5
  %tmpvar = load i32, i32* %tmparray, align 4
  %4 = add i32 %LoadInst4, %tmpvar
  store i32 %4, i32* %res, align 4
  %LoadInst6 = load i32, i32* %i, align 4
  %5 = add i32 %LoadInst6, 1
  store i32 %5, i32* %i, align 4
  br label %while_cond

while_end:                                        ; preds = %while_cond
  store i32 0, i32* @cnt, align 4
  %LoadInst7 = load i32, i32* %res, align 4
  store i32 %LoadInst7, i32* %0, align 4
  br label %return
}

define i32 @main() {
entry:
  %0 = alloca i32, align 4
  %a = alloca i8, align 1
  %tmpvar = load i8, i8* getelementptr inbounds ([100 x i8], [100 x i8]* @cc, i32 0, i32 0), align 1
  store i8 %tmpvar, i8* %a, align 1
  %yy = alloca [100 x i32], align 4
  %l = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %j, align 4
  %scanf = call i32 (...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_Const_String_, i32 0, i32 0), i8* getelementptr inbounds ([100 x i8], [100 x i8]* @cc, i32 0, i32 0))
  store i32 0, i32* @tmp, align 4
  br label %while_cond

return:                                           ; preds = %while_end20, %if40
  %1 = load i32, i32* %0, align 4
  ret i32 %1

while_cond:                                       ; preds = %while_loop, %entry
  %LoadInst = load i32, i32* @tmp, align 4
  %tmparray = getelementptr inbounds [100 x i8], [100 x i8]* @cc, i32 0, i32 %LoadInst
  %tmpvar1 = load i8, i8* %tmparray, align 1
  %LoadInst2 = load i8, i8* %a, align 1
  %2 = icmp sgt i8 %tmpvar1, %LoadInst2
  %while_cond3 = icmp ne i1 %2, false
  br i1 %while_cond3, label %while_loop, label %while_end

while_loop:                                       ; preds = %while_cond
  %LoadInst4 = load i32, i32* @tmp, align 4
  %tmparray5 = getelementptr inbounds [100 x i32], [100 x i32]* %yy, i32 0, i32 %LoadInst4
  %LoadInst6 = load i32, i32* @tmp, align 4
  %tmparray7 = getelementptr inbounds [100 x i8], [100 x i8]* @cc, i32 0, i32 %LoadInst6
  %tmpvar8 = load i8, i8* %tmparray7, align 1
  %typeconvert = zext i8 %tmpvar8 to i32
  %3 = sub i32 %typeconvert, 0
  store i32 %3, i32* %tmparray5, align 4
  %LoadInst9 = load i32, i32* @tmp, align 4
  %4 = add i32 %LoadInst9, 1
  store i32 %4, i32* @tmp, align 4
  br label %while_cond

while_end:                                        ; preds = %while_cond
  %LoadInst10 = load i32, i32* @tmp, align 4
  %5 = sub i32 %LoadInst10, 1
  store i32 %5, i32* @tmp, align 4
  %LoadInst11 = load i32, i32* @tmp, align 4
  %tmparray12 = getelementptr inbounds [100 x i32], [100 x i32]* %yy, i32 0, i32 %LoadInst11
  %tmpvar13 = load i32, i32* %tmparray12, align 4
  %6 = icmp eq i32 %tmpvar13, 10
  %ifcond = icmp ne i1 %6, false
  br i1 %ifcond, label %if, label %else

if:                                               ; preds = %while_end
  store i32 0, i32* @num, align 4
  br label %merge

else:                                             ; preds = %while_end
  %LoadInst14 = load i32, i32* @tmp, align 4
  %7 = add i32 %LoadInst14, 1
  store i32 %7, i32* @tmp, align 4
  %LoadInst15 = load i32, i32* @tmp, align 4
  %tmparray16 = getelementptr inbounds [100 x i32], [100 x i32]* %yy, i32 0, i32 %LoadInst15
  store i32 10, i32* %tmparray16, align 4
  br label %merge

merge:                                            ; preds = %else, %if
  %LoadInst17 = load i32, i32* @tmp, align 4
  %8 = add i32 %LoadInst17, 1
  store i32 %8, i32* %l, align 4
  br label %while_cond18

while_cond18:                                     ; preds = %merge42, %merge
  %LoadInst21 = load i32, i32* %j, align 4
  %LoadInst22 = load i32, i32* %l, align 4
  %9 = icmp slt i32 %LoadInst21, %LoadInst22
  %while_cond23 = icmp ne i1 %9, false
  br i1 %while_cond23, label %while_loop19, label %while_end20

while_loop19:                                     ; preds = %while_cond18
  %LoadInst24 = load i32, i32* %j, align 4
  %tmparray25 = getelementptr inbounds [100 x i32], [100 x i32]* %yy, i32 0, i32 %LoadInst24
  %tmpvar26 = load i32, i32* %tmparray25, align 4
  store i32 %tmpvar26, i32* @num, align 4
  %LoadInst30 = load i32, i32* @num, align 4
  %10 = icmp sgt i32 %LoadInst30, 47
  %ifcond31 = icmp ne i1 %10, false
  br i1 %ifcond31, label %if27, label %else28

while_end20:                                      ; preds = %while_cond18
  store i32 0, i32* %0, align 4
  br label %return

if27:                                             ; preds = %while_loop19
  %LoadInst32 = load i32, i32* @cnt, align 4
  %tmparray33 = getelementptr inbounds [10 x i32], [10 x i32]* @num_tmp, i32 0, i32 %LoadInst32
  %LoadInst34 = load i32, i32* @num, align 4
  %11 = sub i32 %LoadInst34, 48
  store i32 %11, i32* %tmparray33, align 4
  %LoadInst35 = load i32, i32* @cnt, align 4
  %12 = add i32 %LoadInst35, 1
  store i32 %12, i32* @cnt, align 4
  br label %merge29

else28:                                           ; preds = %while_loop19
  %calc_num = call i32 @calc_num()
  store i32 %calc_num, i32* @tmp, align 4
  %LoadInst36 = load i32, i32* @num_cnt, align 4
  %tmparray37 = getelementptr inbounds [15 x i32], [15 x i32]* @num_stack, i32 0, i32 %LoadInst36
  %LoadInst38 = load i32, i32* @tmp, align 4
  store i32 %LoadInst38, i32* %tmparray37, align 4
  %LoadInst39 = load i32, i32* @num_cnt, align 4
  %13 = add i32 %LoadInst39, 1
  store i32 %13, i32* @num_cnt, align 4
  %deal_sym = call i32 @deal_sym()
  br label %merge29

merge29:                                          ; preds = %else28, %if27
  %LoadInst43 = load i32, i32* @num, align 4
  %14 = icmp eq i32 %LoadInst43, 10
  %ifcond44 = icmp ne i1 %14, false
  br i1 %ifcond44, label %if40, label %else41

if40:                                             ; preds = %merge29
  %tmpvar45 = load i32, i32* getelementptr inbounds ([15 x i32], [15 x i32]* @num_stack, i32 0, i32 0), align 4
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_Const_String_.1, i32 0, i32 0), i32 %tmpvar45)
  store i32 0, i32* %0, align 4
  br label %return

else41:                                           ; preds = %merge29
  store i32 0, i32* @tmp, align 4
  br label %merge42

merge42:                                          ; preds = %else41
  %LoadInst46 = load i32, i32* %j, align 4
  %15 = add i32 %LoadInst46, 1
  store i32 %15, i32* %j, align 4
  br label %while_cond18
}
