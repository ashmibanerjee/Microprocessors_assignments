	.file	"toupper.c"
	.text
	.type	toupper_simple, @function
toupper_simple:
.LFB61:
	.cfi_startproc
	movq	%rdi, %r8
	movl	$0, %esi
	movq	$-1, %r9
	movl	$0, %eax
	jmp	.L2
.L4:
	addq	%r8, %rdx
	movzbl	(%rdx), %ecx
	leal	-97(%rcx), %edi
	cmpb	$25, %dil
	ja	.L3
	subl	$32, %ecx
	movb	%cl, (%rdx)
.L3:
	addl	$1, %esi
.L2:
	movslq	%esi, %rdx
	movq	%r9, %rcx
	movq	%r8, %rdi
	repnz scasb
	notq	%rcx
	subq	$1, %rcx
	cmpq	%rcx, %rdx
	jb	.L4
	rep ret
	.cfi_endproc
.LFE61:
	.size	toupper_simple, .-toupper_simple
	.type	toupper_optimised, @function
toupper_optimised:
.LFB62:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 3, -24
	movq	%rdi, %rsi
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movq	$-1, %rcx
	repnz scasb
	movq	%rcx, %rax
	notq	%rax
	subq	$1, %rax
	cltq
	addq	$15, %rax
	andq	$-16, %rax
	subq	%rax, %rsp
	movq	%rsp, %r10
	movl	$0, %edx
	movq	$-1, %r8
	movl	$0, %eax
	movl	$32, %r9d
	jmp	.L6
.L7:
	movsbl	(%rsi,%r11), %ecx
#APP
# 65 "toupper.c" 1
	movl %ecx, %ebx;cmpl $97, %ebx;jge l2;l2:cmpl $122, %ebx;jle l1;jmp l3;l1: subl $32,%ebx;jmp l3;l3: movl %ebx, %ecx;
# 0 "" 2
#NO_APP
	movslq	%edx, %rdi
	movb	%cl, (%r10,%rdi)
	addl	$1, %edx
.L6:
	movslq	%edx, %r11
	movq	%r8, %rcx
	movq	%rsi, %rdi
	repnz scasb
	notq	%rcx
	subq	$1, %rcx
	cmpq	%rcx, %r11
	jb	.L7
	movq	-24(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L8
	call	__stack_chk_fail
.L8:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE62:
	.size	toupper_optimised, .-toupper_optimised
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
	leaq	16(%rax), %rax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE63:
	.size	mymalloc, .-mymalloc
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
	movl	%eax, %ecx
	movl	$1374389535, %edx
	imull	%edx
	sarl	$5, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	imull	$100, %edx, %edx
	subl	%edx, %ecx
	movsbl	%cl, %ecx
	cmpl	%ebx, %ecx
	setge	%bl
	call	rand
	movl	%eax, %ecx
	movl	$1321528399, %edx
	imull	%edx
	sarl	$3, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	imull	$26, %edx, %edx
	subl	%edx, %ecx
	movzbl	%bl, %ebx
	leal	2(%rbx), %eax
	movl	%eax, %ebx
	sall	$5, %ebx
	leal	1(%rbx,%rcx), %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE64:
	.size	createChar, .-createChar
	.globl	init
	.type	init, @function
init:
.LFB65:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%rdi, %r13
	movl	%esi, %r14d
	leaq	1(%rdi), %rdi
	call	mymalloc
	movq	%rax, %r12
	movl	$1, %edi
	call	srand
	testq	%r13, %r13
	je	.L17
	movl	$0, %ebx
	movl	$0, %ebp
.L16:
	movl	%r14d, %edi
	call	createChar
	movb	%al, (%r12,%rbx)
	addl	$1, %ebp
	movslq	%ebp, %rbx
	cmpq	%rbx, %r13
	ja	.L16
	jmp	.L15
.L17:
	movl	$0, %ebx
.L15:
	movb	$0, (%r12,%rbx)
	movq	%r12, %rax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE65:
	.size	init, .-init
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Before: %.40s...\n"
.LC1:
	.string	"After:  %.40s...\n"
	.text
	.globl	run_toupper
	.type	run_toupper, @function
run_toupper:
.LFB66:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$48, %rsp
	.cfi_def_cfa_offset 80
	movq	%rcx, %rbp
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	movl	no_ratio(%rip), %eax
	movl	%eax, %ecx
	imull	%edi, %ecx
	addl	%esi, %ecx
	imull	no_sz(%rip), %edx
	imull	%edx, %eax
	leal	(%rax,%rcx), %ebx
	movslq	%esi, %rsi
	movq	ratios(%rip), %rax
	vcvttsd2si	(%rax,%rsi,8), %esi
	movslq	%edi, %rdi
	movq	sizes(%rip), %rax
	movq	(%rax,%rdi,8), %rdi
	call	init
	movq	%rax, %r12
	cmpl	$0, debug(%rip)
	je	.L21
	movq	%rax, %rdx
	movl	$.LC0, %esi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk
.L21:
	movl	$0, %esi
	leaq	16(%rsp), %rdi
	call	gettimeofday
	vxorpd	%xmm1, %xmm1, %xmm1
	vcvtsi2sdq	24(%rsp), %xmm1, %xmm1
	vmovsd	%xmm1, 8(%rsp)
	movq	%r12, %rdi
	call	*%rbp
	movl	$0, %esi
	leaq	16(%rsp), %rdi
	call	gettimeofday
	vxorpd	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	24(%rsp), %xmm0, %xmm0
	movslq	%ebx, %rbx
	vsubsd	8(%rsp), %xmm0, %xmm0
	movq	results(%rip), %rax
	vmovsd	%xmm0, (%rax,%rbx,8)
	cmpl	$0, debug(%rip)
	je	.L20
	movq	%r12, %rdx
	movl	$.LC1, %esi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk
.L20:
	movq	40(%rsp), %rax
	xorq	%fs:40, %rax
	je	.L23
	call	__stack_chk_fail
.L23:
	addq	$48, %rsp
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE66:
	.size	run_toupper, .-run_toupper
	.globl	run
	.type	run, @function
run:
.LFB67:
	.cfi_startproc
	movq	toupperversion+8(%rip), %rcx
	testq	%rcx, %rcx
	je	.L31
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movl	%esi, %r13d
	movl	%edi, %r12d
	movl	$toupperversion, %ebx
	movl	$0, %ebp
.L27:
	movq	(%rbx), %r8
	movl	%ebp, %edx
	movl	%r13d, %esi
	movl	%r12d, %edi
	call	run_toupper
	addl	$1, %ebp
	addq	$16, %rbx
	movq	8(%rbx), %rcx
	testq	%rcx, %rcx
	jne	.L27
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
.L31:
	rep ret
	.cfi_endproc
.LFE67:
	.size	run, .-run
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.string	"VARIANT2: gcc -lm -march=native toupper.c -O1"
	.align 8
.LC3:
	.string	"Size: %ld \tRatio: %f \tRunning time:"
	.section	.rodata.str1.1
.LC4:
	.string	"\t%s: %f"
	.text
	.globl	printresults
	.type	printresults, @function
printresults:
.LFB68:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movl	$.LC2, %edi
	call	puts
	movl	$0, %r13d
	cmpl	$0, no_sz(%rip)
	jg	.L42
	jmp	.L32
.L37:
	movslq	%r12d, %rax
	movq	ratios(%rip), %rdx
	vmovsd	(%rdx,%rax,8), %xmm0
	movq	sizes(%rip), %rax
	movq	(%rax,%r14), %rdx
	movl	$.LC3, %esi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk
	cmpl	$0, no_version(%rip)
	jle	.L35
	movl	$toupperversion, %ebp
	movl	$0, %ebx
.L36:
	movl	no_ratio(%rip), %eax
	movl	%eax, %edx
	imull	%r13d, %edx
	addl	%r12d, %edx
	movl	%ebx, %ecx
	imull	no_sz(%rip), %ecx
	imull	%ecx, %eax
	addl	%edx, %eax
	cltq
	movq	results(%rip), %rdx
	vmovsd	(%rdx,%rax,8), %xmm0
	movq	0(%rbp), %rdx
	movl	$.LC4, %esi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk
	addl	$1, %ebx
	addq	$16, %rbp
	cmpl	%ebx, no_version(%rip)
	jg	.L36
.L35:
	movl	$10, %edi
	call	putchar
	addl	$1, %r12d
	cmpl	%r12d, no_ratio(%rip)
	jg	.L37
.L38:
	addl	$1, %r13d
	cmpl	%r13d, no_sz(%rip)
	jle	.L32
.L42:
	cmpl	$0, no_ratio(%rip)
	jle	.L38
	movslq	%r13d, %r14
	salq	$3, %r14
	movl	$0, %r12d
	jmp	.L37
.L32:
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE68:
	.size	printresults, .-printresults
	.globl	main
	.type	main, @function
main:
.LFB69:
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
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	movl	%edi, 8(%rsp)
	cmpl	$1, %edi
	jle	.L45
	leaq	8(%rsi), %rbp
	leal	2(%rdi), %r15d
	movl	$3, %r12d
	movl	$1, 20(%rsp)
	movl	$0, 16(%rsp)
	movl	$50, 12(%rsp)
	movl	$10000, %r14d
	movq	$0, 24(%rsp)
	movl	$800000, %r13d
.L55:
	movq	%rbp, %rbx
	movq	0(%rbp), %rax
	cmpb	$45, (%rax)
	jne	.L49
	cmpb	$100, 1(%rax)
	jne	.L47
	cmpb	$0, 2(%rax)
	jne	.L49
	movl	$1, debug(%rip)
	movq	0(%rbp), %rax
	cmpb	$45, (%rax)
	jne	.L48
.L73:
	cmpb	$108, 1(%rax)
	jne	.L49
	cmpb	$0, 2(%rax)
	jne	.L49
	movq	8(%rbx), %rdi
	movl	$10, %edx
	movl	$0, %esi
	call	strtol
	movslq	%eax, %r13
	cmpl	%r12d, 8(%rsp)
	jle	.L50
	movq	16(%rbx), %rdi
	cmpb	$45, (%rdi)
	jne	.L51
	movzbl	1(%rdi), %eax
	cmpb	$114, %al
	jne	.L52
	cmpb	$0, 2(%rdi)
	jne	.L51
	jmp	.L50
.L52:
	cmpb	$100, %al
	jne	.L51
	cmpb	$0, 2(%rdi)
	je	.L50
.L51:
	movl	$10, %edx
	movl	$0, %esi
	call	strtol
	cltq
	movq	%rax, 24(%rsp)
	movq	24(%rbx), %rdi
	movl	$10, %edx
	movl	$0, %esi
	call	strtol
	movslq	%eax, %r14
.L49:
	movq	(%rbx), %rax
	cmpb	$45, (%rax)
	jne	.L48
	cmpb	$114, 1(%rax)
	jne	.L48
	cmpb	$0, 2(%rax)
	jne	.L48
	movq	8(%rbx), %rdi
	movl	$10, %edx
	movl	$0, %esi
	call	strtol
	movl	%eax, 12(%rsp)
	cmpl	%r12d, 8(%rsp)
	jle	.L50
	movq	16(%rbx), %rdi
	cmpb	$45, (%rdi)
	jne	.L53
	movzbl	1(%rdi), %eax
	cmpb	$108, %al
	jne	.L54
	cmpb	$0, 2(%rdi)
	jne	.L53
	jmp	.L50
.L54:
	cmpb	$100, %al
	jne	.L53
	cmpb	$0, 2(%rdi)
	je	.L50
.L53:
	movl	$10, %edx
	movl	$0, %esi
	call	strtol
	movl	%eax, 16(%rsp)
	movq	24(%rbx), %rdi
	movl	$10, %edx
	movl	$0, %esi
	call	strtol
	movl	%eax, 20(%rsp)
.L48:
	addq	$8, %rbp
	addl	$1, %r12d
	cmpl	%r15d, %r12d
	jne	.L55
.L50:
	movl	$0, %ecx
	cmpq	$0, toupperversion+8(%rip)
	jne	.L70
	jmp	.L56
.L78:
	movl	$1, 20(%rsp)
	movl	$0, 16(%rsp)
	movl	$50, 12(%rsp)
	movl	$10000, %r14d
	movq	$0, 24(%rsp)
	movl	$800000, %r13d
.L70:
	cmpq	$1, toupperversion+24(%rip)
	sbbl	%ecx, %ecx
	addl	$2, %ecx
	movl	%ecx, no_version(%rip)
.L56:
	cmpq	$0, 24(%rsp)
	jne	.L58
.L71:
	movl	$1, no_sz(%rip)
	jmp	.L59
.L58:
	movq	24(%rsp), %rax
	subq	%r13, %rax
	movl	$0, %edx
	divq	%r14
	addl	$1, %eax
	movl	%eax, no_sz(%rip)
.L59:
	cmpl	$0, 16(%rsp)
	jne	.L60
	movl	$1, no_ratio(%rip)
	jmp	.L61
.L60:
	movl	16(%rsp), %eax
	subl	12(%rsp), %eax
	cltd
	idivl	20(%rsp)
	addl	$1, %eax
	movl	%eax, no_ratio(%rip)
.L61:
	movl	no_sz(%rip), %ebx
	movl	no_ratio(%rip), %ebp
	imull	%ebx, %ecx
	imull	%ebp, %ecx
	movslq	%ecx, %rdi
	salq	$3, %rdi
	call	malloc
	movq	%rax, results(%rip)
	movslq	%ebp, %rdi
	salq	$3, %rdi
	call	malloc
	movq	%rax, ratios(%rip)
	movslq	%ebx, %rdi
	salq	$3, %rdi
	call	malloc
	movq	%rax, sizes(%rip)
	testl	%ebx, %ebx
	jle	.L62
	movl	$0, %eax
.L63:
	movslq	%eax, %rcx
	movq	%rcx, %rdx
	imulq	%r14, %rdx
	addq	%r13, %rdx
	movq	sizes(%rip), %rsi
	movq	%rdx, (%rsi,%rcx,8)
	addl	$1, %eax
	cmpl	%eax, no_sz(%rip)
	jg	.L63
	cmpl	$0, no_ratio(%rip)
	jle	.L64
.L72:
	movl	20(%rsp), %edi
	movl	12(%rsp), %eax
	movl	$0, %edx
.L65:
	movslq	%edx, %rsi
	vxorpd	%xmm0, %xmm0, %xmm0
	vcvtsi2sd	%eax, %xmm0, %xmm0
	movq	ratios(%rip), %rcx
	vmovsd	%xmm0, (%rcx,%rsi,8)
	addl	$1, %edx
	addl	%edi, %eax
	cmpl	%edx, no_ratio(%rip)
	jg	.L65
.L64:
	movl	$0, %ebp
	cmpl	$0, no_sz(%rip)
	jg	.L84
	jmp	.L67
.L79:
	movl	%ebx, %esi
	movl	%ebp, %edi
	call	run
	addl	$1, %ebx
	cmpl	%ebx, no_ratio(%rip)
	jg	.L79
.L69:
	addl	$1, %ebp
	cmpl	%ebp, no_sz(%rip)
	jle	.L67
.L84:
	movl	$0, %ebx
	cmpl	$0, no_ratio(%rip)
	jg	.L79
	jmp	.L69
.L45:
	cmpq	$0, toupperversion+8(%rip)
	jne	.L78
	movl	$0, %ecx
	movl	$1, 20(%rsp)
	movl	$0, 16(%rsp)
	movl	$50, 12(%rsp)
	movl	$10000, %r14d
	movl	$800000, %r13d
	jmp	.L71
.L62:
	testl	%ebp, %ebp
	jg	.L72
	jmp	.L67
.L47:
	movq	0(%rbp), %rax
	jmp	.L73
.L67:
	movl	$0, %eax
	call	printresults
	movl	$0, %eax
	addq	$40, %rsp
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
.LFE69:
	.size	main, .-main
	.globl	toupperversion
	.section	.rodata.str1.1
.LC5:
	.string	"simple"
.LC6:
	.string	"optimised"
	.data
	.align 32
	.type	toupperversion, @object
	.size	toupperversion, 48
toupperversion:
	.quad	.LC5
	.quad	toupper_simple
	.quad	.LC6
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
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.1) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
