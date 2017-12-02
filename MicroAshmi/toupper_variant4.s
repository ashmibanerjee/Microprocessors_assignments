	.file	"toupper.c"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB0:
	.text
.LHOTB0:
	.p2align 4,,15
	.type	toupper_simple, @function
toupper_simple:
.LFB61:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbp
	xorl	%ebx, %ebx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	strlen
	jmp	.L2
	.p2align 4,,10
	.p2align 3
.L4:
	movzbl	0(%rbp,%rbx), %edx
	leal	-97(%rdx), %ecx
	cmpb	$25, %cl
	ja	.L3
	subl	$32, %edx
	movq	%rbp, %rdi
	movb	%dl, 0(%rbp,%rbx)
	call	strlen
.L3:
	addq	$1, %rbx
.L2:
	cmpq	%rax, %rbx
	jb	.L4
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE61:
	.size	toupper_simple, .-toupper_simple
	.section	.text.unlikely
.LCOLDE0:
	.text
.LHOTE0:
	.section	.text.unlikely
.LCOLDB1:
	.text
.LHOTB1:
	.p2align 4,,15
	.type	toupper_optimised, @function
toupper_optimised:
.LFB62:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, %r12
	subq	$16, %rsp
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	call	strlen
	movslq	%eax, %rdx
	movl	$32, %edi
	addq	$15, %rdx
	andq	$-16, %rdx
	subq	%rdx, %rsp
	xorl	%edx, %edx
	movq	%rsp, %r8
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L9:
	movslq	%edx, %rsi
	movsbl	(%r12,%rdx), %ecx
	addq	$1, %rdx
#APP
# 65 "toupper.c" 1
	movl %ecx, %ebx;cmpl $97, %ebx;jge l2;l2:cmpl $122, %ebx;jle l1;jmp l3;l1: subl $32,%ebx;jmp l3;l3: movl %ebx, %ecx;
# 0 "" 2
#NO_APP
	movb	%cl, (%r8,%rsi)
.L8:
	cmpq	%rdx, %rax
	ja	.L9
	movq	-24(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L13
	leaq	-16(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L13:
	.cfi_restore_state
	call	__stack_chk_fail
	.cfi_endproc
.LFE62:
	.size	toupper_optimised, .-toupper_optimised
	.section	.text.unlikely
.LCOLDE1:
	.text
.LHOTE1:
	.section	.text.unlikely
.LCOLDB2:
	.text
.LHOTB2:
	.p2align 4,,15
	.globl	mymalloc
	.type	mymalloc, @function
mymalloc:
.LFB63:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	addq	$32, %rdi
	call	malloc
	andq	$-16, %rax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	addq	$16, %rax
	ret
	.cfi_endproc
.LFE63:
	.size	mymalloc, .-mymalloc
	.section	.text.unlikely
.LCOLDE2:
	.text
.LHOTE2:
	.section	.text.unlikely
.LCOLDB3:
	.text
.LHOTB3:
	.p2align 4,,15
	.globl	createChar
	.type	createChar, @function
createChar:
.LFB64:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	%edi, %ebx
	call	rand
	movl	$1374389535, %edx
	movl	%eax, %ecx
	imull	%edx
	movl	%ecx, %eax
	sarl	$31, %eax
	sarl	$5, %edx
	subl	%eax, %edx
	imull	$100, %edx, %edx
	subl	%edx, %ecx
	cmpl	%ebx, %ecx
	setge	%bl
	call	rand
	movl	$1321528399, %edx
	movl	%eax, %ecx
	movzbl	%bl, %ebx
	imull	%edx
	movl	%ecx, %eax
	sarl	$31, %eax
	sarl	$3, %edx
	subl	%eax, %edx
	leal	2(%rbx), %eax
	imull	$26, %edx, %edx
	movl	%eax, %ebx
	sall	$5, %ebx
	subl	%edx, %ecx
	leal	1(%rbx,%rcx), %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE64:
	.size	createChar, .-createChar
	.section	.text.unlikely
.LCOLDE3:
	.text
.LHOTE3:
	.section	.text.unlikely
.LCOLDB4:
	.text
.LHOTB4:
	.p2align 4,,15
	.globl	init
	.type	init, @function
init:
.LFB65:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	addq	$33, %rdi
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%esi, %ebp
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	call	malloc
	andq	$-16, %rax
	movl	$1, %edi
	addq	$16, %rax
	movq	%rax, %rbx
	movq	%rax, 8(%rsp)
	call	srand
	testq	%r14, %r14
	je	.L21
	leaq	(%r14,%rbx), %r13
	movq	%rbx, %r15
	movl	$1374389535, %r12d
	.p2align 4,,10
	.p2align 3
.L20:
	call	rand
	movl	%eax, %esi
	imull	%r12d
	movl	%esi, %eax
	sarl	$31, %eax
	sarl	$5, %edx
	subl	%eax, %edx
	imull	$100, %edx, %edx
	subl	%edx, %esi
	cmpl	%esi, %ebp
	setle	%bl
	addq	$1, %r15
	call	rand
	movl	$1321528399, %edx
	movl	%eax, %esi
	movzbl	%bl, %ebx
	imull	%edx
	movl	%esi, %eax
	addl	$2, %ebx
	sarl	$31, %eax
	sall	$5, %ebx
	sarl	$3, %edx
	subl	%eax, %edx
	imull	$26, %edx, %edx
	subl	%edx, %esi
	leal	1(%rbx,%rsi), %eax
	movb	%al, -1(%r15)
	cmpq	%r15, %r13
	jne	.L20
.L19:
	movq	8(%rsp), %rax
	movb	$0, (%rax,%r14)
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L21:
	.cfi_restore_state
	xorl	%r14d, %r14d
	jmp	.L19
	.cfi_endproc
.LFE65:
	.size	init, .-init
	.section	.text.unlikely
.LCOLDE4:
	.text
.LHOTE4:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC5:
	.string	"Before: %.40s...\n"
.LC6:
	.string	"After:  %.40s...\n"
	.section	.text.unlikely
.LCOLDB7:
	.text
.LHOTB7:
	.p2align 4,,15
	.globl	run_toupper
	.type	run_toupper, @function
run_toupper:
.LFB66:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	imull	no_sz(%rip), %edx
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	movl	no_ratio(%rip), %eax
	movq	%rcx, 24(%rsp)
	movl	%eax, %ecx
	imull	%edi, %ecx
	movslq	%edi, %rdi
	imull	%edx, %eax
	addl	%esi, %ecx
	movslq	%esi, %rsi
	addl	%ecx, %eax
	movl	%eax, 12(%rsp)
	movq	ratios(%rip), %rax
	vcvttsd2si	(%rax,%rsi,8), %ebp
	movq	sizes(%rip), %rax
	movq	(%rax,%rdi,8), %r15
	leaq	33(%r15), %rdi
	call	malloc
	andq	$-16, %rax
	movl	$1, %edi
	addq	$16, %rax
	movq	%rax, %rbx
	movq	%rax, (%rsp)
	call	srand
	testq	%r15, %r15
	je	.L25
	leaq	(%r15,%rbx), %r13
	movq	%rbx, %r14
	movl	$1374389535, %r12d
	.p2align 4,,10
	.p2align 3
.L26:
	call	rand
	movl	%eax, %esi
	imull	%r12d
	movl	%esi, %eax
	sarl	$31, %eax
	sarl	$5, %edx
	subl	%eax, %edx
	imull	$100, %edx, %edx
	subl	%edx, %esi
	cmpl	%esi, %ebp
	setle	%bl
	addq	$1, %r14
	call	rand
	movl	$1321528399, %edx
	movl	%eax, %esi
	movzbl	%bl, %ebx
	imull	%edx
	movl	%esi, %eax
	addl	$2, %ebx
	sarl	$31, %eax
	sall	$5, %ebx
	sarl	$3, %edx
	subl	%eax, %edx
	imull	$26, %edx, %edx
	subl	%edx, %esi
	leal	1(%rbx,%rsi), %eax
	movb	%al, -1(%r14)
	cmpq	%r13, %r14
	jne	.L26
.L25:
	movq	(%rsp), %rax
	movb	$0, (%rax,%r15)
	movl	debug(%rip), %edx
	testl	%edx, %edx
	jne	.L36
.L27:
	leaq	32(%rsp), %rdi
	xorl	%esi, %esi
	call	gettimeofday
	vxorpd	%xmm1, %xmm1, %xmm1
	movq	(%rsp), %rdi
	movq	24(%rsp), %rax
	vcvtsi2sdq	40(%rsp), %xmm1, %xmm1
	vmovsd	%xmm1, 16(%rsp)
	call	*%rax
	leaq	32(%rsp), %rdi
	xorl	%esi, %esi
	call	gettimeofday
	vxorpd	%xmm0, %xmm0, %xmm0
	movslq	12(%rsp), %rax
	movq	results(%rip), %rdx
	vcvtsi2sdq	40(%rsp), %xmm0, %xmm0
	vsubsd	16(%rsp), %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%rax,8)
	movl	debug(%rip), %eax
	testl	%eax, %eax
	je	.L24
	movq	(%rsp), %rdx
	movl	$.LC6, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
.L24:
	movq	56(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L37
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L36:
	.cfi_restore_state
	movq	%rax, %rdx
	movl	$.LC5, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	jmp	.L27
.L37:
	call	__stack_chk_fail
	.cfi_endproc
.LFE66:
	.size	run_toupper, .-run_toupper
	.section	.text.unlikely
.LCOLDE7:
	.text
.LHOTE7:
	.section	.text.unlikely
.LCOLDB8:
	.text
.LHOTB8:
	.p2align 4,,15
	.globl	run
	.type	run, @function
run:
.LFB67:
	.cfi_startproc
	movq	toupperversion+8(%rip), %rcx
	testq	%rcx, %rcx
	je	.L47
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movl	%edi, %r13d
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movl	%esi, %r12d
	movl	$toupperversion, %ebx
	xorl	%ebp, %ebp
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
.L42:
	movq	(%rbx), %r8
	movl	%ebp, %edx
	addq	$16, %rbx
	movl	%r12d, %esi
	movl	%r13d, %edi
	addl	$1, %ebp
	call	run_toupper
	movq	8(%rbx), %rcx
	testq	%rcx, %rcx
	jne	.L42
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_restore 12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_restore 13
	.cfi_def_cfa_offset 8
.L47:
	rep ret
	.cfi_endproc
.LFE67:
	.size	run, .-run
	.section	.text.unlikely
.LCOLDE8:
	.text
.LHOTE8:
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC9:
	.string	"VARIANT4: gcc -lm -march=native toupper.c -O3"
	.align 8
.LC10:
	.string	"Size: %ld \tRatio: %f \tRunning time:"
	.section	.rodata.str1.1
.LC11:
	.string	"\t%s: %f"
	.section	.text.unlikely
.LCOLDB12:
	.text
.LHOTB12:
	.p2align 4,,15
	.globl	printresults
	.type	printresults, @function
printresults:
.LFB68:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	$.LC9, %edi
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	call	puts
	movl	no_sz(%rip), %edx
	testl	%edx, %edx
	jle	.L63
	movl	no_ratio(%rip), %eax
	xorl	%r13d, %r13d
	xorl	%ebp, %ebp
	.p2align 4,,10
	.p2align 3
.L50:
	xorl	%r12d, %r12d
	xorl	%ebx, %ebx
	testl	%eax, %eax
	jle	.L56
	.p2align 4,,10
	.p2align 3
.L58:
	movq	ratios(%rip), %rax
	movl	$.LC10, %esi
	movl	$1, %edi
	xorl	%r14d, %r14d
	movl	$toupperversion, %r15d
	vmovsd	(%rax,%r12), %xmm0
	movq	sizes(%rip), %rax
	movq	(%rax,%r13), %rdx
	movl	$1, %eax
	call	__printf_chk
	movl	no_version(%rip), %eax
	testl	%eax, %eax
	jle	.L55
.L59:
	movl	no_sz(%rip), %ecx
	movl	no_ratio(%rip), %eax
	movl	$.LC11, %esi
	movl	$1, %edi
	addq	$16, %r15
	imull	%r14d, %ecx
	movl	%eax, %edx
	addl	$1, %r14d
	imull	%ebp, %edx
	imull	%ecx, %eax
	addl	%ebx, %edx
	addl	%edx, %eax
	movq	results(%rip), %rdx
	cltq
	vmovsd	(%rdx,%rax,8), %xmm0
	movq	-16(%r15), %rdx
	movl	$1, %eax
	call	__printf_chk
	cmpl	%r14d, no_version(%rip)
	jg	.L59
.L55:
	movl	$10, %edi
	addl	$1, %ebx
	addq	$8, %r12
	call	putchar
	movl	no_ratio(%rip), %eax
	cmpl	%ebx, %eax
	jg	.L58
	movl	no_sz(%rip), %edx
.L56:
	addl	$1, %ebp
	addq	$8, %r13
	cmpl	%edx, %ebp
	jl	.L50
.L63:
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE68:
	.size	printresults, .-printresults
	.section	.text.unlikely
.LCOLDE12:
	.text
.LHOTE12:
	.section	.text.unlikely
.LCOLDB15:
	.section	.text.startup,"ax",@progbits
.LHOTB15:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB69:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx
	addq	$-128, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jle	.L67
	leaq	8(%rsi), %r12
	movl	$3, %ebx
	movl	$10000, %r9d
	movl	%ebx, %eax
	movl	$800000, %r8d
	movl	%edi, %r15d
	movq	%r12, %rbx
	leal	2(%rdi), %r13d
	movl	$1, -88(%rbp)
	movl	$0, -108(%rbp)
	movl	$50, %r14d
	movq	$0, -120(%rbp)
	movq	%r8, -96(%rbp)
	movq	%r9, -104(%rbp)
	movl	%eax, %r12d
	jmp	.L76
.L74:
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movq	24(%rbx), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	movl	%eax, -108(%rbp)
	call	strtol
	movl	%eax, -88(%rbp)
.L68:
	addl	$1, %r12d
	addq	$8, %rbx
	cmpl	%r13d, %r12d
	je	.L168
.L76:
	movq	(%rbx), %rax
	cmpb	$45, (%rax)
	jne	.L68
	cmpb	$100, 1(%rax)
	jne	.L69
	cmpb	$0, 2(%rax)
	jne	.L70
	movl	$1, debug(%rip)
	cmpb	$45, (%rax)
	jne	.L68
.L69:
	cmpb	$108, 1(%rax)
	jne	.L70
	cmpb	$0, 2(%rax)
	jne	.L70
	movq	8(%rbx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	call	strtol
	cmpl	%r12d, %r15d
	cltq
	movq	%rax, -96(%rbp)
	jle	.L168
	movq	16(%rbx), %rdi
	cmpb	$45, (%rdi)
	jne	.L72
	movzbl	1(%rdi), %eax
	cmpb	$114, %al
	je	.L175
	cmpb	$100, %al
	jne	.L72
.L175:
	cmpb	$0, 2(%rdi)
	je	.L168
.L72:
	xorl	%esi, %esi
	movl	$10, %edx
	call	strtol
	movq	24(%rbx), %rdi
	cltq
	xorl	%esi, %esi
	movl	$10, %edx
	movq	%rax, -120(%rbp)
	call	strtol
	cltq
	movq	%rax, -104(%rbp)
	movq	(%rbx), %rax
	cmpb	$45, (%rax)
	jne	.L68
.L70:
	cmpb	$114, 1(%rax)
	jne	.L68
	cmpb	$0, 2(%rax)
	jne	.L68
	movq	8(%rbx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	call	strtol
	cmpl	%r12d, %r15d
	movl	%eax, %r14d
	jle	.L168
	movq	16(%rbx), %rdi
	cmpb	$45, (%rdi)
	jne	.L74
	movzbl	1(%rdi), %eax
	cmpb	$108, %al
	je	.L177
	cmpb	$100, %al
	jne	.L74
.L177:
	cmpb	$0, 2(%rdi)
	jne	.L74
.L168:
	xorl	%esi, %esi
	cmpq	$0, toupperversion+8(%rip)
	movq	-96(%rbp), %r8
	movq	-104(%rbp), %r9
	je	.L77
.L112:
	cmpq	$1, toupperversion+24(%rip)
	sbbl	%esi, %esi
	addl	$2, %esi
	movl	%esi, no_version(%rip)
.L77:
	movq	-120(%rbp), %rax
	testq	%rax, %rax
	je	.L123
	subq	%r8, %rax
	xorl	%edx, %edx
	divq	%r9
	leal	1(%rax), %r13d
	movslq	%r13d, %r15
	salq	$3, %r15
.L79:
	movl	-108(%rbp), %eax
	movl	%r13d, no_sz(%rip)
	testl	%eax, %eax
	je	.L80
	subl	%r14d, %eax
	cltd
	idivl	-88(%rbp)
	leal	1(%rax), %ebx
	movslq	%ebx, %r12
	salq	$3, %r12
.L115:
	movl	%esi, %edi
	movq	%r9, -104(%rbp)
	movq	%r8, -96(%rbp)
	imull	%r13d, %edi
	movl	%ebx, no_ratio(%rip)
	imull	%ebx, %edi
	movslq	%edi, %rdi
	salq	$3, %rdi
	call	malloc
	movq	%r12, %rdi
	movq	%rax, results(%rip)
	call	malloc
	movq	%r15, %rdi
	movq	%rax, %r12
	movq	%rax, ratios(%rip)
	call	malloc
	testl	%r13d, %r13d
	movq	%rax, sizes(%rip)
	movq	-96(%rbp), %r8
	movq	-104(%rbp), %r9
	jle	.L178
.L116:
	movq	%rax, %rsi
	andl	$31, %esi
	shrq	$3, %rsi
	negq	%rsi
	andl	$3, %esi
	cmpl	%r13d, %esi
	cmova	%r13d, %esi
	cmpl	$9, %r13d
	jg	.L183
	movl	%r13d, %esi
.L82:
	cmpl	$1, %esi
	movq	%r8, (%rax)
	je	.L126
	leaq	(%r8,%r9), %rdx
	cmpl	$2, %esi
	movq	%rdx, 8(%rax)
	je	.L127
	leaq	(%r9,%r9), %rdx
	cmpl	$3, %esi
	leaq	(%rdx,%r8), %rdi
	movq	%rdi, 16(%rax)
	je	.L128
	addq	%r9, %rdx
	cmpl	$4, %esi
	leaq	(%rdx,%r8), %rdi
	movq	%rdi, 24(%rax)
	je	.L129
	addq	%r9, %rdx
	cmpl	$5, %esi
	leaq	(%rdx,%r8), %rdi
	movq	%rdi, 32(%rax)
	je	.L130
	addq	%r9, %rdx
	cmpl	$6, %esi
	leaq	(%rdx,%r8), %rdi
	movq	%rdi, 40(%rax)
	je	.L131
	addq	%r9, %rdx
	cmpl	$7, %esi
	leaq	(%rdx,%r8), %rdi
	movq	%rdi, 48(%rax)
	je	.L132
	addq	%r9, %rdx
	cmpl	$9, %esi
	leaq	(%rdx,%r8), %rdi
	movq	%rdi, 56(%rax)
	jne	.L133
	addq	%r9, %rdx
	addq	%r8, %rdx
	movq	%rdx, 64(%rax)
	movl	$9, %edx
.L84:
	cmpl	%esi, %r13d
	je	.L85
.L83:
	movl	%r13d, %r10d
	leal	-1(%r13), %ecx
	movl	%esi, %r15d
	subl	%esi, %r10d
	leal	-8(%r10), %edi
	subl	%esi, %ecx
	shrl	$3, %edi
	addl	$1, %edi
	cmpl	$6, %ecx
	leal	0(,%rdi,8), %r11d
	jbe	.L86
	movl	%edx, -96(%rbp)
	vmovdqa	.LC14(%rip), %ymm3
	leaq	(%rax,%r15,8), %rsi
	vpbroadcastd	-96(%rbp), %ymm4
	movq	%r9, -96(%rbp)
	xorl	%r15d, %r15d
	vpbroadcastq	-96(%rbp), %ymm5
	movq	%r8, -96(%rbp)
	vpbroadcastq	-96(%rbp), %ymm7
	vpaddd	.LC13(%rip), %ymm4, %ymm4
	vpsrlq	$32, %ymm5, %ymm6
.L87:
	vpmovsxdq	%xmm4, %ymm2
	addl	$1, %r15d
	addq	$64, %rsi
	vpmuludq	%ymm5, %ymm2, %ymm1
	vpsrlq	$32, %ymm2, %ymm0
	vpmuludq	%ymm2, %ymm6, %ymm2
	vpmuludq	%ymm5, %ymm0, %ymm0
	vpaddq	%ymm2, %ymm0, %ymm0
	vextracti128	$0x1, %ymm4, %xmm2
	vpsllq	$32, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpaddq	%ymm7, %ymm0, %ymm0
	vmovdqa	%ymm0, -64(%rsi)
	vpaddd	%ymm3, %ymm4, %ymm4
	vpmovsxdq	%xmm2, %ymm2
	vpmuludq	%ymm5, %ymm2, %ymm1
	vpsrlq	$32, %ymm2, %ymm0
	vpmuludq	%ymm2, %ymm6, %ymm2
	vpmuludq	%ymm5, %ymm0, %ymm0
	vpaddq	%ymm2, %ymm0, %ymm0
	vpsllq	$32, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpaddq	%ymm7, %ymm0, %ymm0
	vmovdqa	%ymm0, -32(%rsi)
	cmpl	%r15d, %edi
	ja	.L87
	addl	%r11d, %edx
	cmpl	%r10d, %r11d
	je	.L85
.L86:
	movslq	%edx, %rdi
	movq	%r9, %rsi
	imulq	%rdi, %rsi
	leaq	(%r8,%rsi), %r10
	movq	%r10, (%rax,%rdi,8)
	leal	1(%rdx), %edi
	cmpl	%edi, %r13d
	jle	.L85
	addq	%r9, %rsi
	movslq	%edi, %rdi
	leaq	(%rsi,%r8), %r10
	movq	%r10, (%rax,%rdi,8)
	leal	2(%rdx), %edi
	cmpl	%edi, %r13d
	jle	.L85
	addq	%r9, %rsi
	movslq	%edi, %rdi
	leaq	(%rsi,%r8), %r10
	movq	%r10, (%rax,%rdi,8)
	leal	3(%rdx), %edi
	cmpl	%edi, %r13d
	jle	.L85
	addq	%r9, %rsi
	movslq	%edi, %rdi
	leaq	(%rsi,%r8), %r10
	movq	%r10, (%rax,%rdi,8)
	leal	4(%rdx), %edi
	cmpl	%edi, %r13d
	jle	.L85
	addq	%r9, %rsi
	movslq	%edi, %rdi
	leaq	(%r8,%rsi), %r10
	movq	%r10, (%rax,%rdi,8)
	leal	5(%rdx), %edi
	cmpl	%edi, %r13d
	jle	.L85
	addq	%r9, %rsi
	addl	$6, %edx
	movslq	%edi, %rdi
	leaq	(%r8,%rsi), %r10
	cmpl	%edx, %r13d
	movq	%r10, (%rax,%rdi,8)
	jle	.L85
	addq	%r9, %rsi
	movslq	%edx, %rdx
	addq	%rsi, %r8
	movq	%r8, (%rax,%rdx,8)
.L85:
	testl	%ebx, %ebx
	jle	.L100
.L114:
	testl	%ebx, %ebx
	movl	$1, %esi
	movq	%r12, %rdx
	cmovg	%ebx, %esi
	andl	$31, %edx
	shrq	$3, %rdx
	negq	%rdx
	andl	$3, %edx
	cmpl	%esi, %edx
	cmova	%esi, %edx
	cmpl	$9, %esi
	jg	.L184
	movl	%esi, %edx
.L91:
	vxorpd	%xmm0, %xmm0, %xmm0
	cmpl	$1, %edx
	vcvtsi2sd	%r14d, %xmm0, %xmm0
	vmovsd	%xmm0, (%r12)
	je	.L136
	movl	-88(%rbp), %ecx
	vxorpd	%xmm0, %xmm0, %xmm0
	movl	%ecx, %eax
	addl	%r14d, %eax
	cmpl	$2, %edx
	vcvtsi2sd	%eax, %xmm0, %xmm0
	vmovsd	%xmm0, 8(%r12)
	je	.L137
	movl	%ecx, %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	addl	%eax, %eax
	cmpl	$3, %edx
	leal	(%rax,%r14), %edi
	vcvtsi2sd	%edi, %xmm0, %xmm0
	vmovsd	%xmm0, 16(%r12)
	je	.L138
	addl	%ecx, %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	leal	(%rax,%r14), %edi
	cmpl	$4, %edx
	vcvtsi2sd	%edi, %xmm0, %xmm0
	vmovsd	%xmm0, 24(%r12)
	je	.L139
	addl	%ecx, %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	leal	(%rax,%r14), %edi
	cmpl	$5, %edx
	vcvtsi2sd	%edi, %xmm0, %xmm0
	vmovsd	%xmm0, 32(%r12)
	je	.L140
	addl	%ecx, %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	leal	(%rax,%r14), %edi
	cmpl	$6, %edx
	vcvtsi2sd	%edi, %xmm0, %xmm0
	vmovsd	%xmm0, 40(%r12)
	je	.L141
	addl	%ecx, %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	leal	(%rax,%r14), %edi
	cmpl	$7, %edx
	vcvtsi2sd	%edi, %xmm0, %xmm0
	vmovsd	%xmm0, 48(%r12)
	je	.L142
	addl	%ecx, %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	leal	(%r14,%rax), %edi
	cmpl	$9, %edx
	vcvtsi2sd	%edi, %xmm0, %xmm0
	vmovsd	%xmm0, 56(%r12)
	jne	.L143
	vxorpd	%xmm0, %xmm0, %xmm0
	addl	%ecx, %eax
	addl	%r14d, %eax
	vcvtsi2sd	%eax, %xmm0, %xmm0
	vmovsd	%xmm0, 64(%r12)
	movl	$9, %eax
.L93:
	cmpl	%edx, %esi
	je	.L94
.L92:
	subl	%edx, %esi
	leal	-1(%rbx), %r8d
	movl	$0, %r11d
	leal	-8(%rsi), %edi
	movl	%edx, %r10d
	shrl	$3, %edi
	addl	$1, %edi
	testl	%ebx, %ebx
	cmovle	%r11d, %r8d
	leal	0(,%rdi,8), %r9d
	subl	%edx, %r8d
	cmpl	$6, %r8d
	jbe	.L95
	movl	%eax, -96(%rbp)
	vpbroadcastd	-88(%rbp), %ymm4
	leaq	(%r12,%r10,8), %rdx
	vpbroadcastd	-96(%rbp), %ymm1
	movl	%r14d, -96(%rbp)
	xorl	%r8d, %r8d
	vpbroadcastd	-96(%rbp), %ymm2
	vmovdqa	.LC14(%rip), %ymm3
	vpaddd	.LC13(%rip), %ymm1, %ymm1
.L96:
	vpmulld	%ymm1, %ymm4, %ymm0
	vpaddd	%ymm2, %ymm0, %ymm0
	vcvtdq2pd	%xmm0, %ymm5
	vextracti128	$0x1, %ymm0, %xmm0
	addl	$1, %r8d
	vpaddd	%ymm3, %ymm1, %ymm1
	vmovapd	%ymm5, (%rdx)
	addq	$64, %rdx
	vcvtdq2pd	%xmm0, %ymm0
	vmovapd	%ymm0, -32(%rdx)
	cmpl	%r8d, %edi
	ja	.L96
	addl	%r9d, %eax
	cmpl	%esi, %r9d
	je	.L94
.L95:
	movl	-88(%rbp), %ecx
	vxorpd	%xmm0, %xmm0, %xmm0
	movslq	%eax, %rdi
	movl	%ecx, %edx
	imull	%eax, %edx
	leal	(%rdx,%r14), %esi
	vcvtsi2sd	%esi, %xmm0, %xmm0
	leal	1(%rax), %esi
	vmovsd	%xmm0, (%r12,%rdi,8)
	cmpl	%ebx, %esi
	jge	.L94
	addl	%ecx, %edx
	vxorpd	%xmm0, %xmm0, %xmm0
	leal	(%r14,%rdx), %edi
	movslq	%esi, %rsi
	vcvtsi2sd	%edi, %xmm0, %xmm0
	vmovsd	%xmm0, (%r12,%rsi,8)
	leal	2(%rax), %esi
	cmpl	%ebx, %esi
	jge	.L94
	addl	%ecx, %edx
	vxorpd	%xmm0, %xmm0, %xmm0
	leal	(%r14,%rdx), %edi
	movslq	%esi, %rsi
	vcvtsi2sd	%edi, %xmm0, %xmm0
	vmovsd	%xmm0, (%r12,%rsi,8)
	leal	3(%rax), %esi
	cmpl	%ebx, %esi
	jge	.L94
	addl	%ecx, %edx
	vxorpd	%xmm0, %xmm0, %xmm0
	leal	(%r14,%rdx), %edi
	movslq	%esi, %rsi
	vcvtsi2sd	%edi, %xmm0, %xmm0
	vmovsd	%xmm0, (%r12,%rsi,8)
	leal	4(%rax), %esi
	cmpl	%ebx, %esi
	jge	.L94
	addl	%ecx, %edx
	vxorpd	%xmm0, %xmm0, %xmm0
	leal	(%r14,%rdx), %edi
	movslq	%esi, %rsi
	vcvtsi2sd	%edi, %xmm0, %xmm0
	vmovsd	%xmm0, (%r12,%rsi,8)
	leal	5(%rax), %esi
	cmpl	%ebx, %esi
	jge	.L94
	addl	%ecx, %edx
	vxorpd	%xmm0, %xmm0, %xmm0
	leal	(%r14,%rdx), %edi
	addl	$6, %eax
	movslq	%esi, %rsi
	cmpl	%ebx, %eax
	vcvtsi2sd	%edi, %xmm0, %xmm0
	vmovsd	%xmm0, (%r12,%rsi,8)
	jge	.L94
	addl	-88(%rbp), %edx
	vxorpd	%xmm0, %xmm0, %xmm0
	cltq
	addl	%edx, %r14d
	vcvtsi2sd	%r14d, %xmm0, %xmm0
	vmovsd	%xmm0, (%r12,%rax,8)
.L94:
	testl	%r13d, %r13d
	jle	.L185
.L100:
	movq	$0, -160(%rbp)
	movl	$0, -148(%rbp)
	vzeroupper
.L110:
	testl	%ebx, %ebx
	movq	$0, -136(%rbp)
	jle	.L107
	.p2align 4,,10
	.p2align 3
.L160:
	movq	toupperversion+8(%rip), %rax
	movq	-136(%rbp), %rsi
	testq	%rax, %rax
	movl	%esi, -112(%rbp)
	movq	%rax, -104(%rbp)
	je	.L108
	movq	%rsi, %rax
	movq	$toupperversion, -96(%rbp)
	movl	$0, -108(%rbp)
	salq	$3, %rax
	movl	$1374389535, %r14d
	movq	%rax, -144(%rbp)
	movq	%rax, %rsi
.L109:
	imull	-108(%rbp), %r13d
	movl	-148(%rbp), %eax
	movq	-160(%rbp), %rdi
	imull	%ebx, %eax
	addl	-112(%rbp), %eax
	imull	%r13d, %ebx
	addl	%ebx, %eax
	movl	%eax, -120(%rbp)
	movq	ratios(%rip), %rax
	vcvttsd2si	(%rax,%rsi), %r12d
	movq	sizes(%rip), %rax
	movq	(%rax,%rdi), %rax
	leaq	33(%rax), %rdi
	movq	%rax, %r13
	movq	%rax, -128(%rbp)
	call	malloc
	andq	$-16, %rax
	movl	$1, %edi
	addq	$16, %rax
	movq	%rax, %rbx
	movq	%rax, -88(%rbp)
	call	srand
	testq	%r13, %r13
	je	.L102
	addq	%rbx, %r13
	movq	%rbx, %r15
	.p2align 4,,10
	.p2align 3
.L103:
	call	rand
	movl	%eax, %ecx
	imull	%r14d
	movl	%ecx, %eax
	sarl	$31, %eax
	sarl	$5, %edx
	subl	%eax, %edx
	imull	$100, %edx, %edx
	subl	%edx, %ecx
	cmpl	%ecx, %r12d
	setle	%bl
	addq	$1, %r15
	call	rand
	movl	$1321528399, %edx
	movl	%eax, %ecx
	movzbl	%bl, %ebx
	imull	%edx
	movl	%ecx, %eax
	addl	$2, %ebx
	sarl	$31, %eax
	sall	$5, %ebx
	sarl	$3, %edx
	subl	%eax, %edx
	imull	$26, %edx, %edx
	subl	%edx, %ecx
	leal	1(%rbx,%rcx), %eax
	movb	%al, -1(%r15)
	cmpq	%r13, %r15
	jne	.L103
.L102:
	movq	-88(%rbp), %rax
	movq	-128(%rbp), %rsi
	movb	$0, (%rax,%rsi)
	movl	debug(%rip), %edx
	testl	%edx, %edx
	jne	.L186
.L104:
	leaq	-80(%rbp), %rdi
	xorl	%esi, %esi
	call	gettimeofday
	vxorpd	%xmm6, %xmm6, %xmm6
	movq	-88(%rbp), %rdi
	movq	-104(%rbp), %rax
	vcvtsi2sdq	-72(%rbp), %xmm6, %xmm6
	vmovsd	%xmm6, -128(%rbp)
	call	*%rax
	leaq	-80(%rbp), %rdi
	xorl	%esi, %esi
	call	gettimeofday
	vxorpd	%xmm0, %xmm0, %xmm0
	movslq	-120(%rbp), %rax
	movq	results(%rip), %rdx
	vcvtsi2sdq	-72(%rbp), %xmm0, %xmm0
	vsubsd	-128(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx,%rax,8)
	movl	debug(%rip), %eax
	testl	%eax, %eax
	je	.L105
	movq	-88(%rbp), %rdx
	movl	$.LC6, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
.L105:
	addq	$16, -96(%rbp)
	addl	$1, -108(%rbp)
	movq	-96(%rbp), %rax
	movl	no_ratio(%rip), %ebx
	movl	no_sz(%rip), %r13d
	movq	8(%rax), %rax
	testq	%rax, %rax
	movq	%rax, -104(%rbp)
	je	.L187
	movq	-144(%rbp), %rsi
	jmp	.L109
	.p2align 4,,10
	.p2align 3
.L187:
	movq	-136(%rbp), %rsi
.L108:
	movl	%esi, %eax
	addq	$1, %rsi
	addl	$1, %eax
	movq	%rsi, -136(%rbp)
	cmpl	%eax, %ebx
	jg	.L160
.L107:
	addl	$1, -148(%rbp)
	addq	$8, -160(%rbp)
	movl	-148(%rbp), %eax
	cmpl	%r13d, %eax
	jl	.L110
.L101:
	xorl	%eax, %eax
	call	printresults
	xorl	%eax, %eax
	movq	-56(%rbp), %rdi
	xorq	%fs:40, %rdi
	jne	.L188
	subq	$-128, %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L186:
	.cfi_restore_state
	movq	%rax, %rdx
	movl	$.LC5, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	jmp	.L104
.L80:
	movl	%esi, %edi
	movq	%r9, -104(%rbp)
	movq	%r8, -96(%rbp)
	imull	%r13d, %edi
	movl	$1, no_ratio(%rip)
	movl	$1, %ebx
	movslq	%edi, %rdi
	salq	$3, %rdi
	call	malloc
	movl	$8, %edi
	movq	%rax, results(%rip)
	call	malloc
	movq	%r15, %rdi
	movq	%rax, %r12
	movq	%rax, ratios(%rip)
	call	malloc
	testl	%r13d, %r13d
	movq	%rax, sizes(%rip)
	movq	-96(%rbp), %r8
	movq	-104(%rbp), %r9
	jg	.L116
	jmp	.L114
	.p2align 4,,10
	.p2align 3
.L123:
	movl	$8, %r15d
	movl	$1, %r13d
	jmp	.L79
.L183:
	xorl	%edx, %edx
	testl	%esi, %esi
	je	.L83
	jmp	.L82
.L184:
	xorl	%eax, %eax
	testl	%edx, %edx
	je	.L92
	jmp	.L91
.L67:
	cmpq	$0, toupperversion+8(%rip)
	je	.L189
	movl	$1, -88(%rbp)
	movl	$0, -108(%rbp)
	movl	$50, %r14d
	movl	$10000, %r9d
	movq	$0, -120(%rbp)
	movl	$800000, %r8d
	jmp	.L112
.L185:
	vzeroupper
	jmp	.L101
.L189:
	movl	$1, no_sz(%rip)
	movl	$1, -88(%rbp)
	xorl	%esi, %esi
	movl	$50, %r14d
	movl	$10000, %r9d
	movl	$800000, %r8d
	movl	$8, %r15d
	movl	$1, %r13d
	movl	$8, %r12d
	movl	$1, %ebx
	jmp	.L115
.L188:
	call	__stack_chk_fail
.L143:
	movl	$8, %eax
	jmp	.L93
.L142:
	movl	$7, %eax
	jmp	.L93
.L178:
	testl	%ebx, %ebx
	jle	.L101
	jmp	.L114
.L137:
	movl	$2, %eax
	jmp	.L93
.L136:
	movl	$1, %eax
	jmp	.L93
.L141:
	movl	$6, %eax
	jmp	.L93
.L140:
	movl	$5, %eax
	jmp	.L93
.L139:
	movl	$4, %eax
	jmp	.L93
.L138:
	movl	$3, %eax
	jmp	.L93
.L133:
	movl	$8, %edx
	jmp	.L84
.L132:
	movl	$7, %edx
	jmp	.L84
.L131:
	movl	$6, %edx
	jmp	.L84
.L130:
	movl	$5, %edx
	jmp	.L84
.L129:
	movl	$4, %edx
	jmp	.L84
.L128:
	movl	$3, %edx
	jmp	.L84
.L127:
	movl	$2, %edx
	jmp	.L84
.L126:
	movl	$1, %edx
	jmp	.L84
	.cfi_endproc
.LFE69:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE15:
	.section	.text.startup
.LHOTE15:
	.globl	toupperversion
	.section	.rodata.str1.1
.LC16:
	.string	"simple"
.LC17:
	.string	"optimised"
	.data
	.align 32
	.type	toupperversion, @object
	.size	toupperversion, 48
toupperversion:
	.quad	.LC16
	.quad	toupper_simple
	.quad	.LC17
	.quad	toupper_optimised
	.quad	0
	.quad	0
	.globl	no_version
	.align 4
	.type	no_version, @object
	.size	no_version, 4
no_version:
	.long	1
	.globl	no_ratio
	.align 4
	.type	no_ratio, @object
	.size	no_ratio, 4
no_ratio:
	.long	1
	.globl	no_sz
	.align 4
	.type	no_sz, @object
	.size	no_sz, 4
no_sz:
	.long	1
	.comm	sizes,8,8
	.comm	ratios,8,8
	.comm	results,8,8
	.globl	debug
	.bss
	.align 4
	.type	debug, @object
	.size	debug, 4
debug:
	.zero	4
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC13:
	.long	0
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.long	7
	.align 32
.LC14:
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.1) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
