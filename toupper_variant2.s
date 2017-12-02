	.file	"toupper.c"
	.text
	.type	toupper_optimised, @function
toupper_optimised:
.LFB62:
	.cfi_startproc
#APP
# 91 "toupper.c" 1
	dec %rdi
REPEAT:
	inc %rdi
	movb (%rdi), %al
	testb %al, %al
	jz END
	cmpb $97, %al
	jb REPEAT
	cmpb $122, %al
	ja REPEAT
	subb $32, %al
	mov %al, (%rdi)
	jmp REPEAT
END:

# 0 "" 2
#NO_APP
	ret
	.cfi_endproc
.LFE62:
	.size	toupper_optimised, .-toupper_optimised
	.type	toupper_simple, @function
toupper_simple:
.LFB61:
	.cfi_startproc
	movq	%rdi, %r8
	movl	$0, %esi
	movq	$-1, %r9
	movl	$0, %eax
	jmp	.L3
.L5:
	addq	%r8, %rdx
	movzbl	(%rdx), %ecx
	leal	-97(%rcx), %edi
	cmpb	$25, %dil
	ja	.L4
	subl	$32, %ecx
	movb	%cl, (%rdx)
.L4:
	addl	$1, %esi
.L3:
	movslq	%esi, %rdx
	movq	%r9, %rcx
	movq	%r8, %rdi
	repnz scasb
	notq	%rcx
	subq	$1, %rcx
	cmpq	%rcx, %rdx
	jb	.L5
	rep ret
	.cfi_endproc
.LFE61:
	.size	toupper_simple, .-toupper_simple
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
	je	.L13
	movl	$0, %ebx
	movl	$0, %ebp
.L12:
	movl	%r14d, %edi
	call	createChar
	movb	%al, (%r12,%rbx)
	addl	$1, %ebp
	movslq	%ebp, %rbx
	cmpq	%rbx, %r13
	ja	.L12
	jmp	.L11
.L13:
	movl	$0, %ebx
.L11:
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
	movq	40(%rsp), %rax
	xorq	%fs:40, %rax
	je	.L17
	call	__stack_chk_fail
.L17:
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
	je	.L25
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
.L21:
	movq	(%rbx), %r8
	movl	%ebp, %edx
	movl	%r13d, %esi
	movl	%r12d, %edi
	call	run_toupper
	addl	$1, %ebp
	addq	$16, %rbx
	movq	8(%rbx), %rcx
	testq	%rcx, %rcx
	jne	.L21
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
.L25:
	rep ret
	.cfi_endproc
.LFE67:
	.size	run, .-run
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%ld"
.LC1:
	.string	"\t%s %f"
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
	movl	$0, %r13d
	cmpl	$0, no_sz(%rip)
	jg	.L36
	jmp	.L26
.L31:
	movslq	%r12d, %rax
	movq	ratios(%rip), %rdx
	vmovsd	(%rdx,%rax,8), %xmm0
	movq	sizes(%rip), %rax
	movq	(%rax,%r14), %rdx
	movl	$.LC0, %esi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk
	cmpl	$0, no_version(%rip)
	jle	.L29
	movl	$toupperversion, %ebp
	movl	$0, %ebx
.L30:
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
	movl	$.LC1, %esi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk
	addl	$1, %ebx
	addq	$16, %rbp
	cmpl	%ebx, no_version(%rip)
	jg	.L30
.L29:
	movl	$10, %edi
	call	putchar
	addl	$1, %r12d
	cmpl	%r12d, no_ratio(%rip)
	jg	.L31
.L32:
	addl	$1, %r13d
	cmpl	%r13d, no_sz(%rip)
	jle	.L26
.L36:
	cmpl	$0, no_ratio(%rip)
	jle	.L32
	movslq	%r13d, %r14
	salq	$3, %r14
	movl	$0, %r12d
	jmp	.L31
.L26:
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
	jle	.L39
	leaq	8(%rsi), %rbp
	leal	2(%rdi), %r15d
	movl	$3, %r12d
	movl	$1, 20(%rsp)
	movl	$0, 16(%rsp)
	movl	$50, 12(%rsp)
	movl	$10000, %r14d
	movq	$0, 24(%rsp)
	movl	$800000, %r13d
.L49:
	movq	%rbp, %rbx
	movq	0(%rbp), %rax
	cmpb	$45, (%rax)
	jne	.L43
	cmpb	$100, 1(%rax)
	jne	.L41
	cmpb	$0, 2(%rax)
	jne	.L43
	movl	$1, debug(%rip)
	movq	0(%rbp), %rax
	cmpb	$45, (%rax)
	jne	.L42
.L67:
	cmpb	$108, 1(%rax)
	jne	.L43
	cmpb	$0, 2(%rax)
	jne	.L43
	movq	8(%rbx), %rdi
	movl	$10, %edx
	movl	$0, %esi
	call	strtol
	movslq	%eax, %r13
	cmpl	%r12d, 8(%rsp)
	jle	.L44
	movq	16(%rbx), %rdi
	cmpb	$45, (%rdi)
	jne	.L45
	movzbl	1(%rdi), %eax
	cmpb	$114, %al
	jne	.L46
	cmpb	$0, 2(%rdi)
	jne	.L45
	jmp	.L44
.L46:
	cmpb	$100, %al
	jne	.L45
	cmpb	$0, 2(%rdi)
	je	.L44
.L45:
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
.L43:
	movq	(%rbx), %rax
	cmpb	$45, (%rax)
	jne	.L42
	cmpb	$114, 1(%rax)
	jne	.L42
	cmpb	$0, 2(%rax)
	jne	.L42
	movq	8(%rbx), %rdi
	movl	$10, %edx
	movl	$0, %esi
	call	strtol
	movl	%eax, 12(%rsp)
	cmpl	%r12d, 8(%rsp)
	jle	.L44
	movq	16(%rbx), %rdi
	cmpb	$45, (%rdi)
	jne	.L47
	movzbl	1(%rdi), %eax
	cmpb	$108, %al
	jne	.L48
	cmpb	$0, 2(%rdi)
	jne	.L47
	jmp	.L44
.L48:
	cmpb	$100, %al
	jne	.L47
	cmpb	$0, 2(%rdi)
	je	.L44
.L47:
	movl	$10, %edx
	movl	$0, %esi
	call	strtol
	movl	%eax, 16(%rsp)
	movq	24(%rbx), %rdi
	movl	$10, %edx
	movl	$0, %esi
	call	strtol
	movl	%eax, 20(%rsp)
.L42:
	addq	$8, %rbp
	addl	$1, %r12d
	cmpl	%r15d, %r12d
	jne	.L49
.L44:
	movl	$0, %ecx
	cmpq	$0, toupperversion+8(%rip)
	jne	.L64
	jmp	.L50
.L72:
	movl	$1, 20(%rsp)
	movl	$0, 16(%rsp)
	movl	$50, 12(%rsp)
	movl	$10000, %r14d
	movq	$0, 24(%rsp)
	movl	$800000, %r13d
.L64:
	cmpq	$1, toupperversion+24(%rip)
	sbbl	%ecx, %ecx
	addl	$2, %ecx
	movl	%ecx, no_version(%rip)
.L50:
	cmpq	$0, 24(%rsp)
	jne	.L52
.L65:
	movl	$1, no_sz(%rip)
	jmp	.L53
.L52:
	movq	24(%rsp), %rax
	subq	%r13, %rax
	movl	$0, %edx
	divq	%r14
	addl	$1, %eax
	movl	%eax, no_sz(%rip)
.L53:
	cmpl	$0, 16(%rsp)
	jne	.L54
	movl	$1, no_ratio(%rip)
	jmp	.L55
.L54:
	movl	16(%rsp), %eax
	subl	12(%rsp), %eax
	cltd
	idivl	20(%rsp)
	addl	$1, %eax
	movl	%eax, no_ratio(%rip)
.L55:
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
	jle	.L56
	movl	$0, %eax
.L57:
	movslq	%eax, %rcx
	movq	%rcx, %rdx
	imulq	%r14, %rdx
	addq	%r13, %rdx
	movq	sizes(%rip), %rsi
	movq	%rdx, (%rsi,%rcx,8)
	addl	$1, %eax
	cmpl	%eax, no_sz(%rip)
	jg	.L57
	cmpl	$0, no_ratio(%rip)
	jle	.L58
.L66:
	movl	20(%rsp), %edi
	movl	12(%rsp), %eax
	movl	$0, %edx
.L59:
	movslq	%edx, %rsi
	vxorpd	%xmm0, %xmm0, %xmm0
	vcvtsi2sd	%eax, %xmm0, %xmm0
	movq	ratios(%rip), %rcx
	vmovsd	%xmm0, (%rcx,%rsi,8)
	addl	$1, %edx
	addl	%edi, %eax
	cmpl	%edx, no_ratio(%rip)
	jg	.L59
.L58:
	movl	$0, %ebp
	cmpl	$0, no_sz(%rip)
	jg	.L78
	jmp	.L61
.L73:
	movl	%ebx, %esi
	movl	%ebp, %edi
	call	run
	addl	$1, %ebx
	cmpl	%ebx, no_ratio(%rip)
	jg	.L73
.L63:
	addl	$1, %ebp
	cmpl	%ebp, no_sz(%rip)
	jle	.L61
.L78:
	movl	$0, %ebx
	cmpl	$0, no_ratio(%rip)
	jg	.L73
	jmp	.L63
.L39:
	cmpq	$0, toupperversion+8(%rip)
	jne	.L72
	movl	$0, %ecx
	movl	$1, 20(%rsp)
	movl	$0, 16(%rsp)
	movl	$50, 12(%rsp)
	movl	$10000, %r14d
	movl	$800000, %r13d
	jmp	.L65
.L56:
	testl	%ebp, %ebp
	jg	.L66
	jmp	.L61
.L41:
	movq	0(%rbp), %rax
	jmp	.L67
.L61:
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
.LC2:
	.string	""
	.data
	.align 32
	.type	toupperversion, @object
	.size	toupperversion, 48
toupperversion:
	.quad	.LC2
	.quad	toupper_simple
	.quad	.LC2
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
