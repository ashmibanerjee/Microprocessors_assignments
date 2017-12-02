	.file	"toupper.c"
	.globl	debug
	.bss
	.align 4
	.type	debug, @object
	.size	debug, 4
debug:
	.zero	4
	.comm	results,8,8
	.comm	ratios,8,8
	.comm	sizes,8,8
	.globl	no_sz
	.data
	.align 4
	.type	no_sz, @object
	.size	no_sz, 4
no_sz:
	.long	1
	.globl	no_ratio
	.align 4
	.type	no_ratio, @object
	.size	no_ratio, 4
no_ratio:
	.long	1
	.globl	no_version
	.align 4
	.type	no_version, @object
	.size	no_version, 4
no_version:
	.long	1
	.text
	.type	gettime, @function
gettime:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-32(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	gettimeofday
	movq	-24(%rbp), %rax
	movq	%rax, -40(%rbp)
	vxorpd	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	-40(%rbp), %xmm0, %xmm0
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L3
	call	__stack_chk_fail
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	gettime, .-gettime
	.type	toupper_simple, @function
toupper_simple:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)
	movl	$0, -20(%rbp)
	movl	$0, -20(%rbp)
	jmp	.L5
.L7:
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$96, %al
	jle	.L6
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$122, %al
	jg	.L6
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rcx
	movq	-40(%rbp), %rdx
	addq	%rcx, %rdx
	movzbl	(%rdx), %edx
	subl	$32, %edx
	movb	%dl, (%rax)
.L6:
	addl	$1, -20(%rbp)
.L5:
	movl	-20(%rbp), %eax
	movslq	%eax, %rbx
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	cmpq	%rax, %rbx
	jb	.L7
	nop
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	toupper_simple, .-toupper_simple
	.type	toupper_optimised, @function
toupper_optimised:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$80, %rsp
	.cfi_offset 14, -24
	.cfi_offset 13, -32
	.cfi_offset 12, -40
	.cfi_offset 3, -48
	movq	%rdi, -88(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -40(%rbp)
	xorl	%eax, %eax
	movq	%rsp, %rax
	movq	%rax, %r12
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movl	%eax, -68(%rbp)
	movl	-68(%rbp), %eax
	movslq	%eax, %rdx
	subq	$1, %rdx
	movq	%rdx, -56(%rbp)
	movslq	%eax, %rdx
	movq	%rdx, -112(%rbp)
	movq	$0, -104(%rbp)
	movslq	%eax, %rdx
	movq	%rdx, %r13
	movl	$0, %r14d
	cltq
	movl	$16, %edx
	subq	$1, %rdx
	addq	%rdx, %rax
	movl	$16, %esi
	movl	$0, %edx
	divq	%rsi
	imulq	$16, %rax, %rax
	subq	%rax, %rsp
	movq	%rsp, %rax
	addq	$0, %rax
	movq	%rax, -48(%rbp)
	movl	$0, -72(%rbp)
	jmp	.L9
.L10:
	movl	-72(%rbp), %eax
	movslq	%eax, %rdx
	movq	-88(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, -64(%rbp)
	movl	-72(%rbp), %eax
	movslq	%eax, %rdx
	movq	-88(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, -60(%rbp)
	movl	-60(%rbp), %eax
	movl	$32, %edx
#APP
# 65 "toupper.c" 1
	movl %eax, %ebx;cmpl $97, %ebx;jge l2;l2:cmpl $122, %ebx;jle l1;jmp l3;l1: subl $32,%ebx;jmp l3;l3: movl %ebx, %eax;
# 0 "" 2
#NO_APP
	movl	%eax, -64(%rbp)
	movl	-64(%rbp), %eax
	movl	%eax, %ecx
	movq	-48(%rbp), %rdx
	movl	-72(%rbp), %eax
	cltq
	movb	%cl, (%rdx,%rax)
	addl	$1, -72(%rbp)
.L9:
	movl	-72(%rbp), %eax
	movslq	%eax, %rbx
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	cmpq	%rax, %rbx
	jb	.L10
	movq	%r12, %rsp
	nop
	movq	-40(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L11
	call	__stack_chk_fail
.L11:
	leaq	-32(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	toupper_optimised, .-toupper_optimised
	.globl	mymalloc
	.type	mymalloc, @function
mymalloc:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	addq	$32, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	shrq	$4, %rax
	addq	$1, %rax
	salq	$4, %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	mymalloc, .-mymalloc
	.globl	createChar
	.type	createChar, @function
createChar:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	call	rand
	movl	%eax, %ecx
	movl	$1374389535, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$5, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	imull	$100, %eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movb	%al, -2(%rbp)
	movsbl	-2(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jge	.L15
	movb	$0, -2(%rbp)
	jmp	.L16
.L15:
	movb	$1, -2(%rbp)
.L16:
	call	rand
	movl	%eax, %ecx
	movl	$1321528399, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$3, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	imull	$26, %eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	addl	$1, %eax
	movb	%al, -1(%rbp)
	movsbl	-2(%rbp), %eax
	addl	$2, %eax
	sall	$5, %eax
	movl	%eax, %edx
	movzbl	-1(%rbp), %eax
	addl	%edx, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	createChar, .-createChar
	.globl	init
	.type	init, @function
init:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	$0, -12(%rbp)
	movq	-24(%rbp), %rax
	addq	$1, %rax
	movq	%rax, %rdi
	call	mymalloc
	movq	%rax, -8(%rbp)
	movl	$1, %edi
	call	srand
	movl	$0, -12(%rbp)
	jmp	.L19
.L20:
	movl	-28(%rbp), %eax
	movl	%eax, %edi
	call	createChar
	movb	%al, -13(%rbp)
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rax, %rdx
	movzbl	-13(%rbp), %eax
	movb	%al, (%rdx)
	addl	$1, -12(%rbp)
.L19:
	movl	-12(%rbp), %eax
	cltq
	cmpq	-24(%rbp), %rax
	jb	.L20
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	init, .-init
	.section	.rodata
.LC0:
	.string	"Before: %.40s...\n"
.LC1:
	.string	"After:  %.40s...\n"
	.text
	.globl	run_toupper
	.type	run_toupper, @function
run_toupper:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movl	%edi, -36(%rbp)
	movl	%esi, -40(%rbp)
	movl	%edx, -44(%rbp)
	movq	%rcx, -56(%rbp)
	movq	%r8, -64(%rbp)
	movl	-40(%rbp), %eax
	movl	%eax, -28(%rbp)
	movl	no_ratio(%rip), %eax
	imull	-36(%rbp), %eax
	addl	%eax, -28(%rbp)
	movl	no_sz(%rip), %eax
	imull	-44(%rbp), %eax
	movl	%eax, %edx
	movl	no_ratio(%rip), %eax
	imull	%edx, %eax
	addl	%eax, -28(%rbp)
	movq	ratios(%rip), %rax
	movl	-40(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	vmovsd	(%rax), %xmm0
	vcvttsd2si	%xmm0, %edx
	movq	sizes(%rip), %rax
	movl	-36(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	init
	movq	%rax, -24(%rbp)
	movl	debug(%rip), %eax
	testl	%eax, %eax
	je	.L23
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
.L23:
	call	gettime
	vmovq	%xmm0, %rax
	movq	%rax, -16(%rbp)
	movq	-24(%rbp), %rdx
	movq	-56(%rbp), %rax
	movq	%rdx, %rdi
	call	*%rax
	call	gettime
	vmovq	%xmm0, %rax
	movq	%rax, -8(%rbp)
	movq	results(%rip), %rax
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	vmovsd	-8(%rbp), %xmm0
	vsubsd	-16(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, (%rax)
	movl	debug(%rip), %eax
	testl	%eax, %eax
	je	.L25
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
.L25:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	run_toupper, .-run_toupper
	.globl	toupperversion
	.section	.rodata
.LC2:
	.string	"simple"
.LC3:
	.string	"optimised"
	.data
	.align 32
	.type	toupperversion, @object
	.size	toupperversion, 48
toupperversion:
	.quad	.LC2
	.quad	toupper_simple
	.quad	.LC3
	.quad	toupper_optimised
	.quad	0
	.quad	0
	.text
	.globl	run
	.type	run, @function
run:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L27
.L28:
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	$toupperversion, %rax
	movq	(%rax), %rdi
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	$toupperversion+8, %rax
	movq	(%rax), %rcx
	movl	-4(%rbp), %edx
	movl	-24(%rbp), %esi
	movl	-20(%rbp), %eax
	movq	%rdi, %r8
	movl	%eax, %edi
	call	run_toupper
	addl	$1, -4(%rbp)
.L27:
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	$toupperversion+8, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L28
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	run, .-run
	.section	.rodata
	.align 8
.LC4:
	.string	"VARIANT1: gcc -lm -march=native toupper.c -O0 "
	.align 8
.LC5:
	.string	"Size: %ld \tRatio: %f \tRunning time:"
.LC6:
	.string	"\t%s: %f"
	.text
	.globl	printresults
	.type	printresults, @function
printresults:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	$.LC4, %edi
	call	puts
	movl	$0, -12(%rbp)
	jmp	.L30
.L35:
	movl	$0, -8(%rbp)
	jmp	.L31
.L34:
	movq	ratios(%rip), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movq	sizes(%rip), %rax
	movl	-12(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	%rdx, -24(%rbp)
	vmovsd	-24(%rbp), %xmm0
	movq	%rax, %rsi
	movl	$.LC5, %edi
	movl	$1, %eax
	call	printf
	movl	$0, -16(%rbp)
	jmp	.L32
.L33:
	movl	-8(%rbp), %eax
	movl	%eax, -4(%rbp)
	movl	no_ratio(%rip), %eax
	imull	-12(%rbp), %eax
	addl	%eax, -4(%rbp)
	movl	no_sz(%rip), %eax
	imull	-16(%rbp), %eax
	movl	%eax, %edx
	movl	no_ratio(%rip), %eax
	imull	%edx, %eax
	addl	%eax, -4(%rbp)
	movq	results(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movl	-16(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	$toupperversion, %rax
	movq	(%rax), %rax
	movq	%rdx, -24(%rbp)
	vmovsd	-24(%rbp), %xmm0
	movq	%rax, %rsi
	movl	$.LC6, %edi
	movl	$1, %eax
	call	printf
	addl	$1, -16(%rbp)
.L32:
	movl	no_version(%rip), %eax
	cmpl	%eax, -16(%rbp)
	jl	.L33
	movl	$10, %edi
	call	putchar
	addl	$1, -8(%rbp)
.L31:
	movl	no_ratio(%rip), %eax
	cmpl	%eax, -8(%rbp)
	jl	.L34
	addl	$1, -12(%rbp)
.L30:
	movl	no_sz(%rip), %eax
	cmpl	%eax, -12(%rbp)
	jl	.L35
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	printresults, .-printresults
	.section	.rodata
.LC7:
	.string	"-d"
.LC8:
	.string	"-l"
.LC9:
	.string	"-r"
	.text
	.globl	main
	.type	main, @function
main:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movl	%edi, -68(%rbp)
	movq	%rsi, -80(%rbp)
	movq	$800000, -24(%rbp)
	movq	$0, -16(%rbp)
	movq	$10000, -8(%rbp)
	movl	$50, -56(%rbp)
	movl	$0, -52(%rbp)
	movl	$1, -48(%rbp)
	movl	$1, -44(%rbp)
	jmp	.L37
.L48:
	movl	-44(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movl	$.LC7, %edi
	call	strcmp
	testl	%eax, %eax
	jne	.L38
	movl	$1, debug(%rip)
.L38:
	movl	-44(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movl	$.LC8, %edi
	call	strcmp
	testl	%eax, %eax
	jne	.L39
	movl	-44(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	cltq
	movq	%rax, -24(%rbp)
	movl	-44(%rbp), %eax
	addl	$2, %eax
	cmpl	-68(%rbp), %eax
	jge	.L64
	movl	-44(%rbp), %eax
	cltq
	addq	$2, %rax
	leaq	0(,%rax,8), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movl	$.LC9, %edi
	call	strcmp
	testl	%eax, %eax
	je	.L65
	movl	-44(%rbp), %eax
	cltq
	addq	$2, %rax
	leaq	0(,%rax,8), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movl	$.LC7, %edi
	call	strcmp
	testl	%eax, %eax
	je	.L66
	movl	-44(%rbp), %eax
	cltq
	addq	$2, %rax
	leaq	0(,%rax,8), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	cltq
	movq	%rax, -16(%rbp)
	movl	-44(%rbp), %eax
	cltq
	addq	$3, %rax
	leaq	0(,%rax,8), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	cltq
	movq	%rax, -8(%rbp)
.L39:
	movl	-44(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movl	$.LC9, %edi
	call	strcmp
	testl	%eax, %eax
	jne	.L44
	movl	-44(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, -56(%rbp)
	movl	-44(%rbp), %eax
	addl	$2, %eax
	cmpl	-68(%rbp), %eax
	jge	.L67
	movl	-44(%rbp), %eax
	cltq
	addq	$2, %rax
	leaq	0(,%rax,8), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movl	$.LC8, %edi
	call	strcmp
	testl	%eax, %eax
	je	.L68
	movl	-44(%rbp), %eax
	cltq
	addq	$2, %rax
	leaq	0(,%rax,8), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movl	$.LC7, %edi
	call	strcmp
	testl	%eax, %eax
	je	.L69
	movl	-44(%rbp), %eax
	cltq
	addq	$2, %rax
	leaq	0(,%rax,8), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, -52(%rbp)
	movl	-44(%rbp), %eax
	cltq
	addq	$3, %rax
	leaq	0(,%rax,8), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, -48(%rbp)
.L44:
	addl	$1, -44(%rbp)
.L37:
	movl	-44(%rbp), %eax
	cmpl	-68(%rbp), %eax
	jl	.L48
	jmp	.L41
.L64:
	nop
	jmp	.L41
.L65:
	nop
	jmp	.L41
.L66:
	nop
	jmp	.L41
.L67:
	nop
	jmp	.L41
.L68:
	nop
	jmp	.L41
.L69:
	nop
.L41:
	movl	$0, -32(%rbp)
	jmp	.L49
.L50:
	movl	-32(%rbp), %eax
	addl	$1, %eax
	movl	%eax, no_version(%rip)
	addl	$1, -32(%rbp)
.L49:
	movl	-32(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	$toupperversion+8, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L50
	cmpq	$0, -16(%rbp)
	jne	.L51
	movl	$1, no_sz(%rip)
	jmp	.L52
.L51:
	movq	-16(%rbp), %rax
	subq	-24(%rbp), %rax
	movl	$0, %edx
	divq	-8(%rbp)
	addl	$1, %eax
	movl	%eax, no_sz(%rip)
.L52:
	cmpl	$0, -52(%rbp)
	jne	.L53
	movl	$1, no_ratio(%rip)
	jmp	.L54
.L53:
	movl	-52(%rbp), %eax
	subl	-56(%rbp), %eax
	cltd
	idivl	-48(%rbp)
	addl	$1, %eax
	movl	%eax, no_ratio(%rip)
.L54:
	movl	no_sz(%rip), %eax
	imull	-32(%rbp), %eax
	movl	%eax, %edx
	movl	no_ratio(%rip), %eax
	imull	%edx, %eax
	movl	%eax, -28(%rbp)
	movl	-28(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, results(%rip)
	movl	no_ratio(%rip), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, ratios(%rip)
	movl	no_sz(%rip), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, sizes(%rip)
	movl	$0, -40(%rbp)
	jmp	.L55
.L56:
	movq	sizes(%rip), %rax
	movl	-40(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rax, %rdx
	movl	-40(%rbp), %eax
	cltq
	imulq	-8(%rbp), %rax
	movq	%rax, %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	movq	%rax, (%rdx)
	addl	$1, -40(%rbp)
.L55:
	movl	no_sz(%rip), %eax
	cmpl	%eax, -40(%rbp)
	jl	.L56
	movl	$0, -40(%rbp)
	jmp	.L57
.L58:
	movq	ratios(%rip), %rax
	movl	-40(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rax, %rdx
	movl	-40(%rbp), %eax
	imull	-48(%rbp), %eax
	movl	%eax, %ecx
	movl	-56(%rbp), %eax
	addl	%ecx, %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	vcvtsi2sd	%eax, %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx)
	addl	$1, -40(%rbp)
.L57:
	movl	no_ratio(%rip), %eax
	cmpl	%eax, -40(%rbp)
	jl	.L58
	movl	$0, -40(%rbp)
	jmp	.L59
.L62:
	movl	$0, -36(%rbp)
	jmp	.L60
.L61:
	movl	-36(%rbp), %edx
	movl	-40(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	run
	addl	$1, -36(%rbp)
.L60:
	movl	no_ratio(%rip), %eax
	cmpl	%eax, -36(%rbp)
	jl	.L61
	addl	$1, -40(%rbp)
.L59:
	movl	no_sz(%rip), %eax
	cmpl	%eax, -40(%rbp)
	jl	.L62
	movl	$0, %eax
	call	printresults
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.1) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
