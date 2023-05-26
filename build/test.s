	.text
	.file	"main"
	.globl	calc                    # -- Begin function calc
	.p2align	4, 0x90
	.type	calc,@function
calc:                                   # @calc
	.cfi_startproc
# %bb.0:                                # %entry
	movl	.Lsym_cnt(%rip), %eax
	decl	%eax
	cltq
	movl	.Lsymbol_stack(,%rax,4), %eax
	movl	%eax, -8(%rsp)
	movl	.Lnum_cnt(%rip), %ecx
	leal	-2(%rcx), %edx
	movslq	%edx, %rdx
	movl	.Lnum_stack(,%rdx,4), %edx
	movl	%edx, .Ltmp(%rip)
	decl	%ecx
	movslq	%ecx, %rcx
	movl	.Lnum_stack(,%rcx,4), %ecx
	movl	%ecx, -12(%rsp)
	cmpl	$43, %eax
	jne	.LBB0_4
# %bb.1:                                # %if
	movl	.Ltmp(%rip), %eax
	addl	-12(%rsp), %eax
	jmp	.LBB0_2
.LBB0_4:                                # %else
	cmpl	$45, -8(%rsp)
	jne	.LBB0_6
# %bb.5:                                # %if10
	movl	.Ltmp(%rip), %eax
	subl	-12(%rsp), %eax
	jmp	.LBB0_2
.LBB0_6:                                # %else11
	cmpl	$42, -8(%rsp)
	jne	.LBB0_8
# %bb.7:                                # %if17
	movl	.Ltmp(%rip), %eax
	imull	-12(%rsp), %eax
	jmp	.LBB0_2
.LBB0_8:                                # %else18
	cmpl	$47, -8(%rsp)
	jne	.LBB0_10
# %bb.9:                                # %if24
	movl	.Ltmp(%rip), %eax
	cltd
	idivl	-12(%rsp)
.LBB0_2:                                # %merge
	movl	%eax, -16(%rsp)
.LBB0_3:                                # %merge
	decl	.Lsym_cnt(%rip)
	movl	.Lnum_cnt(%rip), %eax
	leal	-1(%rax), %ecx
	movl	%ecx, .Lnum_cnt(%rip)
	addl	$-2, %eax
	cltq
	movl	-16(%rsp), %ecx
	movl	%ecx, .Lnum_stack(,%rax,4)
	movl	$0, -4(%rsp)
	xorl	%eax, %eax
	retq
.LBB0_10:                               # %else25
	movl	$0, -16(%rsp)
	jmp	.LBB0_3
.Lfunc_end0:
	.size	calc, .Lfunc_end0-calc
	.cfi_endproc
                                        # -- End function
	.globl	calc_pri                # -- Begin function calc_pri
	.p2align	4, 0x90
	.type	calc_pri,@function
calc_pri:                               # @calc_pri
	.cfi_startproc
# %bb.0:                                # %entry
	cmpl	$0, .Lsym_cnt(%rip)
	jne	.LBB1_3
# %bb.1:                                # %if
	movl	$2, .Lp(%rip)
	cmpl	$1, .Lq(%rip)
	jne	.LBB1_5
# %bb.2:                                # %if1
	movl	$0, .Lp(%rip)
	jmp	.LBB1_9
.LBB1_3:                                # %else
	movl	.Lsym_cnt(%rip), %eax
	decl	%eax
	cltq
	movl	.Lsymbol_stack(,%rax,4), %eax
	movl	%eax, -8(%rsp)
	cmpl	$42, %eax
	je	.LBB1_4
# %bb.6:                                # %else8
	cmpl	$45, -8(%rsp)
	jne	.LBB1_8
.LBB1_4:                                # %if7
	movl	$4, .Lp(%rip)
	jmp	.LBB1_9
.LBB1_5:                                # %else2
	movl	$0, .Ltmp(%rip)
.LBB1_9:                                # %merge
	movl	$0, -4(%rsp)
	xorl	%eax, %eax
	retq
.LBB1_8:                                # %else13
	movl	$3, .Lp(%rip)
	jmp	.LBB1_9
.Lfunc_end1:
	.size	calc_pri, .Lfunc_end1-calc_pri
	.cfi_endproc
                                        # -- End function
	.globl	deal_sym                # -- Begin function deal_sym
	.p2align	4, 0x90
	.type	deal_sym,@function
deal_sym:                               # @deal_sym
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
	cmpl	$42, .Lnum(%rip)
	jne	.LBB2_2
# %bb.1:                                # %if
	movl	$4, .Lq(%rip)
	jmp	.LBB2_7
.LBB2_2:                                # %else
	cmpl	$47, .Lnum(%rip)
	jne	.LBB2_4
# %bb.3:                                # %if1
	movl	$4, .Lq(%rip)
	jmp	.LBB2_7
.LBB2_4:                                # %else2
	cmpl	$10, .Lnum(%rip)
	jne	.LBB2_6
# %bb.5:                                # %if6
	movl	$1, .Lq(%rip)
	jmp	.LBB2_7
.LBB2_6:                                # %else7
	movl	$3, .Lq(%rip)
	jmp	.LBB2_7
	.p2align	4, 0x90
.LBB2_8:                                # %while_loop
                                        #   in Loop: Header=BB2_7 Depth=1
	callq	calc
	callq	calc_pri
.LBB2_7:                                # %while_cond
                                        # =>This Inner Loop Header: Depth=1
	movl	.Lp(%rip), %eax
	incl	%eax
	cmpl	.Lq(%rip), %eax
	jg	.LBB2_8
# %bb.9:                                # %while_end
	movslq	.Lsym_cnt(%rip), %rax
	movl	.Lnum(%rip), %ecx
	movl	%ecx, .Lsymbol_stack(,%rax,4)
	incl	.Lsym_cnt(%rip)
	movl	.Lq(%rip), %eax
	movl	%eax, .Lp(%rip)
	movl	$0, 4(%rsp)
	xorl	%eax, %eax
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end2:
	.size	deal_sym, .Lfunc_end2-deal_sym
	.cfi_endproc
                                        # -- End function
	.globl	calc_num                # -- Begin function calc_num
	.p2align	4, 0x90
	.type	calc_num,@function
calc_num:                               # @calc_num
	.cfi_startproc
# %bb.0:                                # %entry
	movl	$0, -8(%rsp)
	movl	$0, -12(%rsp)
	.p2align	4, 0x90
.LBB3_1:                                # %while_cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-12(%rsp), %eax
	cmpl	.Lcnt(%rip), %eax
	jge	.LBB3_3
# %bb.2:                                # %while_loop
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	-8(%rsp), %eax
	leal	(%rax,%rax,4), %eax
	addl	%eax, %eax
	movslq	-12(%rsp), %rcx
	addl	.Lnum_tmp(,%rcx,4), %eax
	movl	%eax, -8(%rsp)
	incl	-12(%rsp)
	jmp	.LBB3_1
.LBB3_3:                                # %while_end
	movl	$0, .Lcnt(%rip)
	movl	-8(%rsp), %eax
	movl	%eax, -4(%rsp)
	movl	-4(%rsp), %eax
	retq
.Lfunc_end3:
	.size	calc_num, .Lfunc_end3-calc_num
	.cfi_endproc
                                        # -- End function
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	subq	$424, %rsp              # imm = 0x1A8
	.cfi_def_cfa_offset 432
	movb	.Lcc(%rip), %al
	movb	%al, 11(%rsp)
	movl	$0, 12(%rsp)
	movl	$.L_Const_String_, %edi
	movl	$.Lcc, %esi
	xorl	%eax, %eax
	callq	scanf
	movl	$0, .Ltmp(%rip)
	.p2align	4, 0x90
.LBB4_1:                                # %while_cond
                                        # =>This Inner Loop Header: Depth=1
	movslq	.Ltmp(%rip), %rax
	movzbl	.Lcc(%rax), %eax
	cmpb	11(%rsp), %al
	jle	.LBB4_3
# %bb.2:                                # %while_loop
                                        #   in Loop: Header=BB4_1 Depth=1
	movslq	.Ltmp(%rip), %rax
	movzbl	.Lcc(%rax), %ecx
	movl	%ecx, 24(%rsp,%rax,4)
	incl	%eax
	movl	%eax, .Ltmp(%rip)
	jmp	.LBB4_1
.LBB4_3:                                # %while_end
	movl	.Ltmp(%rip), %eax
	decl	%eax
	movl	%eax, .Ltmp(%rip)
	cltq
	cmpl	$10, 24(%rsp,%rax,4)
	jne	.LBB4_5
# %bb.4:                                # %if
	movl	$0, .Lnum(%rip)
	jmp	.LBB4_6
.LBB4_5:                                # %else
	movl	.Ltmp(%rip), %eax
	incl	%eax
	movl	%eax, .Ltmp(%rip)
	cltq
	movl	$10, 24(%rsp,%rax,4)
.LBB4_6:                                # %merge
	movl	.Ltmp(%rip), %eax
	incl	%eax
	movl	%eax, 20(%rsp)
	.p2align	4, 0x90
.LBB4_7:                                # %while_cond18
                                        # =>This Inner Loop Header: Depth=1
	movl	12(%rsp), %eax
	cmpl	20(%rsp), %eax
	jge	.LBB4_13
# %bb.8:                                # %while_loop19
                                        #   in Loop: Header=BB4_7 Depth=1
	movslq	12(%rsp), %rax
	movl	24(%rsp,%rax,4), %eax
	movl	%eax, .Lnum(%rip)
	cmpl	$47, %eax
	jle	.LBB4_10
# %bb.9:                                # %if27
                                        #   in Loop: Header=BB4_7 Depth=1
	movslq	.Lcnt(%rip), %rax
	movl	.Lnum(%rip), %ecx
	addl	$-48, %ecx
	movl	%ecx, .Lnum_tmp(,%rax,4)
	incl	.Lcnt(%rip)
	cmpl	$10, .Lnum(%rip)
	jne	.LBB4_14
	jmp	.LBB4_12
	.p2align	4, 0x90
.LBB4_10:                               # %else28
                                        #   in Loop: Header=BB4_7 Depth=1
	callq	calc_num
	movl	%eax, .Ltmp(%rip)
	movslq	.Lnum_cnt(%rip), %rcx
	movl	%eax, .Lnum_stack(,%rcx,4)
	incl	.Lnum_cnt(%rip)
	callq	deal_sym
	cmpl	$10, .Lnum(%rip)
	je	.LBB4_12
.LBB4_14:                               # %else41
                                        #   in Loop: Header=BB4_7 Depth=1
	movl	$0, .Ltmp(%rip)
	incl	12(%rsp)
	jmp	.LBB4_7
.LBB4_12:                               # %if40
	movl	.Lnum_stack(%rip), %esi
	movl	$.L_Const_String_.1, %edi
	xorl	%eax, %eax
	callq	printf
.LBB4_13:                               # %while_end20
	movl	$0, 16(%rsp)
	movl	16(%rsp), %eax
	addq	$424, %rsp              # imm = 0x1A8
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end4:
	.size	main, .Lfunc_end4-main
	.cfi_endproc
                                        # -- End function
	.type	.Lnum,@object           # @num
	.local	.Lnum
	.comm	.Lnum,4,4
	.type	.Ltmp,@object           # @tmp
	.local	.Ltmp
	.comm	.Ltmp,4,4
	.type	.Lnum_cnt,@object       # @num_cnt
	.local	.Lnum_cnt
	.comm	.Lnum_cnt,4,4
	.type	.Lsym_cnt,@object       # @sym_cnt
	.local	.Lsym_cnt
	.comm	.Lsym_cnt,4,4
	.type	.Lnum_stack,@object     # @num_stack
	.local	.Lnum_stack
	.comm	.Lnum_stack,60,16
	.type	.Lsymbol_stack,@object  # @symbol_stack
	.local	.Lsymbol_stack
	.comm	.Lsymbol_stack,60,16
	.type	.Lnum_tmp,@object       # @num_tmp
	.local	.Lnum_tmp
	.comm	.Lnum_tmp,40,16
	.type	.Lcnt,@object           # @cnt
	.local	.Lcnt
	.comm	.Lcnt,4,4
	.type	.Lp,@object             # @p
	.local	.Lp
	.comm	.Lp,4,4
	.type	.Lq,@object             # @q
	.local	.Lq
	.comm	.Lq,4,4
	.type	.Lcc,@object            # @cc
	.local	.Lcc
	.comm	.Lcc,100,16
	.type	.L_Const_String_,@object # @_Const_String_
	.section	.rodata,"a",@progbits
.L_Const_String_:
	.asciz	"%s"
	.size	.L_Const_String_, 3

	.type	.L_Const_String_.1,@object # @_Const_String_.1
.L_Const_String_.1:
	.asciz	"%d\n"
	.size	.L_Const_String_.1, 4

	.section	".note.GNU-stack","",@progbits
