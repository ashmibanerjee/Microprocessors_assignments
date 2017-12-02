	.file	"toupper.c"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB0:
	.text
.LHOTB0:
	.p2align 4,,15
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
	.section	.text.unlikely
.LCOLDE0:
	.text
.LHOTE0:
	.section	.text.unlikely
.LCOLDB1:
	.text
.LHOTB1:
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
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L5:
	movzbl	0(%rbp,%rbx), %edx
	leal	-97(%rdx), %ecx
	cmpb	$25, %cl
	ja	.L4
	subl	$32, %edx
	movq	%rbp, %rdi
	movb	%dl, 0(%rbp,%rbx)
	call	strlen
.L4:
	addq	$1, %rbx
.L3:
	cmpq	%rax, %rbx
	jb	.L5
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
	je	.L15
	leaq	(%r14,%rbx), %r13
	movq	%rbx, %r15
	movl	$1374389535, %r12d
	.p2align 4,,10
	.p2align 3
.L14:
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
	jne	.L14
.L13:
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
.L15:
	.cfi_restore_state
	xorl	%r14d, %r14d
	jmp	.L13
	.cfi_endproc
.LFE65:
	.size	init, .-init
	.section	.text.unlikely
.LCOLDE4:
	.text
.LHOTE4:
	.section	.text.unlikely
.LCOLDB5:
	.text
.LHOTB5:
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
	movq	(%rax,%rdi,8), %r14
	leaq	33(%r14), %rdi
	call	malloc
	andq	$-16, %rax
	movl	$1, %edi
	addq	$16, %rax
	movq	%rax, %rbx
	movq	%rax, 16(%rsp)
	call	srand
	testq	%r14, %r14
	je	.L19
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
	cmpq	%r13, %r15
	jne	.L20
.L19:
	movq	16(%rsp), %rbx
	leaq	32(%rsp), %rdi
	xorl	%esi, %esi
	movb	$0, (%rbx,%r14)
	call	gettimeofday
	vxorpd	%xmm1, %xmm1, %xmm1
	movq	%rbx, %rdi
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
	movq	56(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L28
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
.L28:
	.cfi_restore_state
	call	__stack_chk_fail
	.cfi_endproc
.LFE66:
	.size	run_toupper, .-run_toupper
	.section	.text.unlikely
.LCOLDE5:
	.text
.LHOTE5:
	.section	.text.unlikely
.LCOLDB6:
	.text
.LHOTB6:
	.p2align 4,,15
	.globl	run
	.type	run, @function
run:
.LFB67:
	.cfi_startproc
	movq	toupperversion+8(%rip), %rcx
	testq	%rcx, %rcx
	je	.L38
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
.L33:
	movq	(%rbx), %r8
	movl	%ebp, %edx
	addq	$16, %rbx
	movl	%r12d, %esi
	movl	%r13d, %edi
	addl	$1, %ebp
	call	run_toupper
	movq	8(%rbx), %rcx
	testq	%rcx, %rcx
	jne	.L33
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
.L38:
	rep ret
	.cfi_endproc
.LFE67:
	.size	run, .-run
	.section	.text.unlikely
.LCOLDE6:
	.text
.LHOTE6:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC7:
	.string	"%ld"
.LC8:
	.string	"\t%s %f"
	.section	.text.unlikely
.LCOLDB9:
	.text
.LHOTB9:
	.p2align 4,,15
	.globl	printresults
	.type	printresults, @function
printresults:
.LFB68:
	.cfi_startproc
	movl	no_sz(%rip), %edx
	testl	%edx, %edx
	jle	.L57
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
	xorl	%r13d, %r13d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	xorl	%ebp, %ebp
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	movl	no_ratio(%rip), %eax
	.p2align 4,,10
	.p2align 3
.L41:
	xorl	%r12d, %r12d
	xorl	%ebx, %ebx
	testl	%eax, %eax
	jle	.L47
	.p2align 4,,10
	.p2align 3
.L49:
	movq	ratios(%rip), %rax
	movl	$.LC7, %esi
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
	jle	.L46
.L50:
	movl	no_sz(%rip), %ecx
	movl	no_ratio(%rip), %eax
	movl	$.LC8, %esi
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
	jg	.L50
.L46:
	movl	$10, %edi
	addl	$1, %ebx
	addq	$8, %r12
	call	putchar
	movl	no_ratio(%rip), %eax
	cmpl	%ebx, %eax
	jg	.L49
	movl	no_sz(%rip), %edx
.L47:
	addl	$1, %ebp
	addq	$8, %r13
	cmpl	%edx, %ebp
	jl	.L41
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_restore 12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_restore 13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_restore 14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_restore 15
	.cfi_def_cfa_offset 8
.L57:
	rep ret
	.cfi_endproc
.LFE68:
	.size	printresults, .-printresults
	.section	.text.unlikely
.LCOLDE9:
	.text
.LHOTE9:
	.section	.text.unlikely
.LCOLDB12:
	.section	.text.startup,"ax",@progbits
.LHOTB12:
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
	jle	.L60
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
	jmp	.L69
.L67:
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movq	24(%rbx), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	movl	%eax, -108(%rbp)
	call	strtol
	movl	%eax, -88(%rbp)
.L61:
	addl	$1, %r12d
	addq	$8, %rbx
	cmpl	%r13d, %r12d
	je	.L159
.L69:
	movq	(%rbx), %rax
	cmpb	$45, (%rax)
	jne	.L61
	cmpb	$100, 1(%rax)
	jne	.L62
	cmpb	$0, 2(%rax)
	jne	.L63
	movl	$1, debug(%rip)
	cmpb	$45, (%rax)
	jne	.L61
.L62:
	cmpb	$108, 1(%rax)
	jne	.L63
	cmpb	$0, 2(%rax)
	jne	.L63
	movq	8(%rbx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	call	strtol
	cmpl	%r12d, %r15d
	cltq
	movq	%rax, -96(%rbp)
	jle	.L159
	movq	16(%rbx), %rdi
	cmpb	$45, (%rdi)
	jne	.L65
	movzbl	1(%rdi), %eax
	cmpb	$114, %al
	je	.L166
	cmpb	$100, %al
	jne	.L65
.L166:
	cmpb	$0, 2(%rdi)
	je	.L159
.L65:
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
	jne	.L61
.L63:
	cmpb	$114, 1(%rax)
	jne	.L61
	cmpb	$0, 2(%rax)
	jne	.L61
	movq	8(%rbx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	call	strtol
	cmpl	%r12d, %r15d
	movl	%eax, %r14d
	jle	.L159
	movq	16(%rbx), %rdi
	cmpb	$45, (%rdi)
	jne	.L67
	movzbl	1(%rdi), %eax
	cmpb	$108, %al
	je	.L168
	cmpb	$100, %al
	jne	.L67
.L168:
	cmpb	$0, 2(%rdi)
	jne	.L67
.L159:
	xorl	%esi, %esi
	cmpq	$0, toupperversion+8(%rip)
	movq	-96(%rbp), %r8
	movq	-104(%rbp), %r9
	je	.L70
.L103:
	cmpq	$1, toupperversion+24(%rip)
	sbbl	%esi, %esi
	addl	$2, %esi
	movl	%esi, no_version(%rip)
.L70:
	movq	-120(%rbp), %rax
	testq	%rax, %rax
	je	.L114
	subq	%r8, %rax
	xorl	%edx, %edx
	divq	%r9
	leal	1(%rax), %r13d
	movslq	%r13d, %r15
	salq	$3, %r15
.L72:
	movl	-108(%rbp), %eax
	movl	%r13d, no_sz(%rip)
	testl	%eax, %eax
	je	.L73
	subl	%r14d, %eax
	cltd
	idivl	-88(%rbp)
	leal	1(%rax), %ebx
	movslq	%ebx, %r12
	salq	$3, %r12
.L106:
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
	jle	.L169
.L107:
	movq	%rax, %rsi
	andl	$31, %esi
	shrq	$3, %rsi
	negq	%rsi
	andl	$3, %esi
	cmpl	%r13d, %esi
	cmova	%r13d, %esi
	cmpl	$9, %r13d
	jg	.L174
	movl	%r13d, %esi
.L75:
	cmpl	$1, %esi
	movq	%r8, (%rax)
	je	.L117
	leaq	(%r8,%r9), %rdx
	cmpl	$2, %esi
	movq	%rdx, 8(%rax)
	je	.L118
	leaq	(%r9,%r9), %rdx
	cmpl	$3, %esi
	leaq	(%rdx,%r8), %rdi
	movq	%rdi, 16(%rax)
	je	.L119
	addq	%r9, %rdx
	cmpl	$4, %esi
	leaq	(%rdx,%r8), %rdi
	movq	%rdi, 24(%rax)
	je	.L120
	addq	%r9, %rdx
	cmpl	$5, %esi
	leaq	(%rdx,%r8), %rdi
	movq	%rdi, 32(%rax)
	je	.L121
	addq	%r9, %rdx
	cmpl	$6, %esi
	leaq	(%rdx,%r8), %rdi
	movq	%rdi, 40(%rax)
	je	.L122
	addq	%r9, %rdx
	cmpl	$7, %esi
	leaq	(%rdx,%r8), %rdi
	movq	%rdi, 48(%rax)
	je	.L123
	addq	%r9, %rdx
	cmpl	$9, %esi
	leaq	(%rdx,%r8), %rdi
	movq	%rdi, 56(%rax)
	jne	.L124
	addq	%r9, %rdx
	addq	%r8, %rdx
	movq	%rdx, 64(%rax)
	movl	$9, %edx
.L77:
	cmpl	%esi, %r13d
	je	.L78
.L76:
	movl	%r13d, %r11d
	leal	-1(%r13), %ecx
	movl	%esi, %r15d
	subl	%esi, %r11d
	leal	-8(%r11), %edi
	subl	%esi, %ecx
	shrl	$3, %edi
	addl	$1, %edi
	cmpl	$6, %ecx
	leal	0(,%rdi,8), %r10d
	jbe	.L79
	movl	%edx, -96(%rbp)
	vmovdqa	.LC11(%rip), %ymm3
	leaq	(%rax,%r15,8), %rsi
	vpbroadcastd	-96(%rbp), %ymm4
	movq	%r9, -96(%rbp)
	xorl	%r15d, %r15d
	vpbroadcastq	-96(%rbp), %ymm5
	movq	%r8, -96(%rbp)
	vpbroadcastq	-96(%rbp), %ymm7
	vpaddd	.LC10(%rip), %ymm4, %ymm4
	vpsrlq	$32, %ymm5, %ymm6
.L80:
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
	cmpl	%edi, %r15d
	jb	.L80
	addl	%r10d, %edx
	cmpl	%r10d, %r11d
	je	.L78
.L79:
	movslq	%edx, %rdi
	movq	%r9, %rsi
	imulq	%rdi, %rsi
	leaq	(%r8,%rsi), %r10
	movq	%r10, (%rax,%rdi,8)
	leal	1(%rdx), %edi
	cmpl	%r13d, %edi
	jge	.L78
	addq	%r9, %rsi
	movslq	%edi, %rdi
	leaq	(%rsi,%r8), %r10
	movq	%r10, (%rax,%rdi,8)
	leal	2(%rdx), %edi
	cmpl	%r13d, %edi
	jge	.L78
	addq	%r9, %rsi
	movslq	%edi, %rdi
	leaq	(%rsi,%r8), %r10
	movq	%r10, (%rax,%rdi,8)
	leal	3(%rdx), %edi
	cmpl	%r13d, %edi
	jge	.L78
	addq	%r9, %rsi
	movslq	%edi, %rdi
	leaq	(%rsi,%r8), %r10
	movq	%r10, (%rax,%rdi,8)
	leal	4(%rdx), %edi
	cmpl	%r13d, %edi
	jge	.L78
	addq	%r9, %rsi
	movslq	%edi, %rdi
	leaq	(%r8,%rsi), %r10
	movq	%r10, (%rax,%rdi,8)
	leal	5(%rdx), %edi
	cmpl	%r13d, %edi
	jge	.L78
	addq	%r9, %rsi
	addl	$6, %edx
	movslq	%edi, %rdi
	leaq	(%r8,%rsi), %r10
	cmpl	%r13d, %edx
	movq	%r10, (%rax,%rdi,8)
	jge	.L78
	addq	%r9, %rsi
	movslq	%edx, %rdx
	addq	%rsi, %r8
	movq	%r8, (%rax,%rdx,8)
.L78:
	testl	%ebx, %ebx
	jle	.L93
.L105:
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
	jg	.L175
	movl	%esi, %edx
.L84:
	vxorpd	%xmm0, %xmm0, %xmm0
	cmpl	$1, %edx
	vcvtsi2sd	%r14d, %xmm0, %xmm0
	vmovsd	%xmm0, (%r12)
	je	.L127
	movl	-88(%rbp), %ecx
	vxorpd	%xmm0, %xmm0, %xmm0
	movl	%ecx, %eax
	addl	%r14d, %eax
	cmpl	$2, %edx
	vcvtsi2sd	%eax, %xmm0, %xmm0
	vmovsd	%xmm0, 8(%r12)
	je	.L128
	movl	%ecx, %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	addl	%eax, %eax
	cmpl	$3, %edx
	leal	(%rax,%r14), %edi
	vcvtsi2sd	%edi, %xmm0, %xmm0
	vmovsd	%xmm0, 16(%r12)
	je	.L129
	addl	%ecx, %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	leal	(%rax,%r14), %edi
	cmpl	$4, %edx
	vcvtsi2sd	%edi, %xmm0, %xmm0
	vmovsd	%xmm0, 24(%r12)
	je	.L130
	addl	%ecx, %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	leal	(%rax,%r14), %edi
	cmpl	$5, %edx
	vcvtsi2sd	%edi, %xmm0, %xmm0
	vmovsd	%xmm0, 32(%r12)
	je	.L131
	addl	%ecx, %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	leal	(%rax,%r14), %edi
	cmpl	$6, %edx
	vcvtsi2sd	%edi, %xmm0, %xmm0
	vmovsd	%xmm0, 40(%r12)
	je	.L132
	addl	%ecx, %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	leal	(%rax,%r14), %edi
	cmpl	$7, %edx
	vcvtsi2sd	%edi, %xmm0, %xmm0
	vmovsd	%xmm0, 48(%r12)
	je	.L133
	addl	%ecx, %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	leal	(%r14,%rax), %edi
	cmpl	$9, %edx
	vcvtsi2sd	%edi, %xmm0, %xmm0
	vmovsd	%xmm0, 56(%r12)
	jne	.L134
	vxorpd	%xmm0, %xmm0, %xmm0
	addl	%ecx, %eax
	addl	%r14d, %eax
	vcvtsi2sd	%eax, %xmm0, %xmm0
	vmovsd	%xmm0, 64(%r12)
	movl	$9, %eax
.L86:
	cmpl	%edx, %esi
	je	.L87
.L85:
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
	jbe	.L88
	movl	%eax, -96(%rbp)
	vpbroadcastd	-88(%rbp), %ymm4
	leaq	(%r12,%r10,8), %rdx
	vpbroadcastd	-96(%rbp), %ymm1
	movl	%r14d, -96(%rbp)
	xorl	%r8d, %r8d
	vpbroadcastd	-96(%rbp), %ymm2
	vmovdqa	.LC11(%rip), %ymm3
	vpaddd	.LC10(%rip), %ymm1, %ymm1
.L89:
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
	ja	.L89
	addl	%r9d, %eax
	cmpl	%esi, %r9d
	je	.L87
.L88:
	movl	-88(%rbp), %ecx
	vxorpd	%xmm0, %xmm0, %xmm0
	movslq	%eax, %rdi
	movl	%ecx, %edx
	imull	%eax, %edx
	leal	(%rdx,%r14), %esi
	vcvtsi2sd	%esi, %xmm0, %xmm0
	leal	1(%rax), %esi
	vmovsd	%xmm0, (%r12,%rdi,8)
	cmpl	%esi, %ebx
	jle	.L87
	addl	%ecx, %edx
	vxorpd	%xmm0, %xmm0, %xmm0
	leal	(%r14,%rdx), %edi
	movslq	%esi, %rsi
	vcvtsi2sd	%edi, %xmm0, %xmm0
	vmovsd	%xmm0, (%r12,%rsi,8)
	leal	2(%rax), %esi
	cmpl	%ebx, %esi
	jge	.L87
	addl	%ecx, %edx
	vxorpd	%xmm0, %xmm0, %xmm0
	leal	(%r14,%rdx), %edi
	movslq	%esi, %rsi
	vcvtsi2sd	%edi, %xmm0, %xmm0
	vmovsd	%xmm0, (%r12,%rsi,8)
	leal	3(%rax), %esi
	cmpl	%esi, %ebx
	jle	.L87
	addl	%ecx, %edx
	vxorpd	%xmm0, %xmm0, %xmm0
	leal	(%r14,%rdx), %edi
	movslq	%esi, %rsi
	vcvtsi2sd	%edi, %xmm0, %xmm0
	vmovsd	%xmm0, (%r12,%rsi,8)
	leal	4(%rax), %esi
	cmpl	%esi, %ebx
	jle	.L87
	addl	%ecx, %edx
	vxorpd	%xmm0, %xmm0, %xmm0
	leal	(%r14,%rdx), %edi
	movslq	%esi, %rsi
	vcvtsi2sd	%edi, %xmm0, %xmm0
	vmovsd	%xmm0, (%r12,%rsi,8)
	leal	5(%rax), %esi
	cmpl	%esi, %ebx
	jle	.L87
	addl	%ecx, %edx
	vxorpd	%xmm0, %xmm0, %xmm0
	leal	(%r14,%rdx), %edi
	addl	$6, %eax
	movslq	%esi, %rsi
	cmpl	%eax, %ebx
	vcvtsi2sd	%edi, %xmm0, %xmm0
	vmovsd	%xmm0, (%r12,%rsi,8)
	jle	.L87
	addl	-88(%rbp), %edx
	vxorpd	%xmm0, %xmm0, %xmm0
	cltq
	addl	%edx, %r14d
	vcvtsi2sd	%r14d, %xmm0, %xmm0
	vmovsd	%xmm0, (%r12,%rax,8)
.L87:
	testl	%r13d, %r13d
	jle	.L176
.L93:
	movq	$0, -160(%rbp)
	movl	$0, -148(%rbp)
	vzeroupper
.L101:
	testl	%ebx, %ebx
	movq	$0, -136(%rbp)
	jle	.L98
	.p2align 4,,10
	.p2align 3
.L151:
	movq	toupperversion+8(%rip), %rax
	movq	-136(%rbp), %rsi
	testq	%rax, %rax
	movl	%esi, -112(%rbp)
	movq	%rax, -96(%rbp)
	je	.L99
	movq	%rsi, %rax
	movq	$toupperversion, -88(%rbp)
	movl	$0, -104(%rbp)
	salq	$3, %rax
	movl	$1374389535, %r15d
	movq	%rax, -144(%rbp)
	movq	%rax, %rsi
.L100:
	imull	-104(%rbp), %r13d
	movl	-148(%rbp), %eax
	movq	-160(%rbp), %rdi
	imull	%ebx, %eax
	addl	-112(%rbp), %eax
	imull	%r13d, %ebx
	addl	%ebx, %eax
	movl	%eax, -108(%rbp)
	movq	ratios(%rip), %rax
	vcvttsd2si	(%rax,%rsi), %r12d
	movq	sizes(%rip), %rax
	movq	(%rax,%rdi), %rax
	leaq	33(%rax), %rdi
	movq	%rax, %r13
	movq	%rax, -120(%rbp)
	call	malloc
	andq	$-16, %rax
	movl	$1, %edi
	addq	$16, %rax
	movq	%rax, %rbx
	movq	%rax, -128(%rbp)
	call	srand
	testq	%r13, %r13
	je	.L95
	addq	%rbx, %r13
	movq	%rbx, %r14
	.p2align 4,,10
	.p2align 3
.L96:
	call	rand
	movl	%eax, %ecx
	imull	%r15d
	movl	%ecx, %eax
	sarl	$31, %eax
	sarl	$5, %edx
	subl	%eax, %edx
	imull	$100, %edx, %edx
	subl	%edx, %ecx
	cmpl	%ecx, %r12d
	setle	%bl
	addq	$1, %r14
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
	movb	%al, -1(%r14)
	cmpq	%r13, %r14
	jne	.L96
.L95:
	movq	-128(%rbp), %rbx
	movq	-120(%rbp), %rsi
	leaq	-80(%rbp), %rdi
	movb	$0, (%rbx,%rsi)
	xorl	%esi, %esi
	call	gettimeofday
	vxorpd	%xmm6, %xmm6, %xmm6
	movq	%rbx, %rdi
	movq	-96(%rbp), %rax
	vcvtsi2sdq	-72(%rbp), %xmm6, %xmm6
	vmovsd	%xmm6, -120(%rbp)
	call	*%rax
	leaq	-80(%rbp), %rdi
	xorl	%esi, %esi
	call	gettimeofday
	vxorpd	%xmm0, %xmm0, %xmm0
	movslq	-108(%rbp), %rax
	movq	results(%rip), %rdx
	addq	$16, -88(%rbp)
	addl	$1, -104(%rbp)
	movl	no_ratio(%rip), %ebx
	vcvtsi2sdq	-72(%rbp), %xmm0, %xmm0
	vsubsd	-120(%rbp), %xmm0, %xmm0
	movl	no_sz(%rip), %r13d
	vmovsd	%xmm0, (%rdx,%rax,8)
	movq	-88(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	movq	%rax, -96(%rbp)
	je	.L177
	movq	-144(%rbp), %rsi
	jmp	.L100
	.p2align 4,,10
	.p2align 3
.L177:
	movq	-136(%rbp), %rsi
.L99:
	movl	%esi, %eax
	addq	$1, %rsi
	addl	$1, %eax
	movq	%rsi, -136(%rbp)
	cmpl	%eax, %ebx
	jg	.L151
.L98:
	addl	$1, -148(%rbp)
	addq	$8, -160(%rbp)
	movl	-148(%rbp), %eax
	cmpl	%r13d, %eax
	jl	.L101
.L94:
	xorl	%eax, %eax
	call	printresults
	xorl	%eax, %eax
	movq	-56(%rbp), %rdi
	xorq	%fs:40, %rdi
	jne	.L178
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
.L73:
	.cfi_restore_state
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
	jg	.L107
	jmp	.L105
	.p2align 4,,10
	.p2align 3
.L114:
	movl	$8, %r15d
	movl	$1, %r13d
	jmp	.L72
.L174:
	xorl	%edx, %edx
	testl	%esi, %esi
	je	.L76
	jmp	.L75
.L175:
	xorl	%eax, %eax
	testl	%edx, %edx
	je	.L85
	jmp	.L84
.L60:
	cmpq	$0, toupperversion+8(%rip)
	je	.L179
	movl	$1, -88(%rbp)
	movl	$0, -108(%rbp)
	movl	$50, %r14d
	movl	$10000, %r9d
	movq	$0, -120(%rbp)
	movl	$800000, %r8d
	jmp	.L103
.L176:
	vzeroupper
	jmp	.L94
.L179:
	movl	$1, no_sz(%rip)
	movl	$1, -88(%rbp)
	xorl	%esi, %esi
	movl	$50, %r14d
	movl	$10000, %r9d
	movl	$800000, %r8d
	movl	$1, %r13d
	movl	$8, %r15d
	movl	$8, %r12d
	movl	$1, %ebx
	jmp	.L106
.L178:
	call	__stack_chk_fail
.L134:
	movl	$8, %eax
	jmp	.L86
.L133:
	movl	$7, %eax
	jmp	.L86
.L169:
	testl	%ebx, %ebx
	jle	.L94
	jmp	.L105
.L128:
	movl	$2, %eax
	jmp	.L86
.L127:
	movl	$1, %eax
	jmp	.L86
.L132:
	movl	$6, %eax
	jmp	.L86
.L131:
	movl	$5, %eax
	jmp	.L86
.L130:
	movl	$4, %eax
	jmp	.L86
.L129:
	movl	$3, %eax
	jmp	.L86
.L124:
	movl	$8, %edx
	jmp	.L77
.L123:
	movl	$7, %edx
	jmp	.L77
.L122:
	movl	$6, %edx
	jmp	.L77
.L121:
	movl	$5, %edx
	jmp	.L77
.L120:
	movl	$4, %edx
	jmp	.L77
.L119:
	movl	$3, %edx
	jmp	.L77
.L118:
	movl	$2, %edx
	jmp	.L77
.L117:
	movl	$1, %edx
	jmp	.L77
	.cfi_endproc
.LFE69:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE12:
	.section	.text.startup
.LHOTE12:
	.globl	toupperversion
	.section	.rodata.str1.1
.LC13:
	.string	""
	.data
	.align 32
	.type	toupperversion, @object
	.size	toupperversion, 48
toupperversion:
	.quad	.LC13
	.quad	toupper_simple
	.quad	.LC13
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
.LC10:
	.long	0
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.long	7
	.align 32
.LC11:
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
