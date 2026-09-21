	.file	"main.c"
	.text
	.globl	main                            # -- Begin function main
	.p2align	4
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rsi, %r13
	cmpl	$2, %edi
	jg	.LBB0_2
# %bb.1:
	movq	(%r13), %rsi
	leaq	.L.str(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	$1, %r15d
	jmp	.LBB0_9
.LBB0_2:
	movq	8(%r13), %rdi
	callq	read_file
	movq	%rax, %rbx
	movslq	8(%rax), %r14
	testq	%r14, %r14
	jle	.LBB0_5
# %bb.3:
	movq	(%rbx), %r15
	xorl	%r12d, %r12d
	.p2align	4
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	movsbl	(%r15,%r12), %edi
	callq	putchar@PLT
	incq	%r12
	cmpq	%r12, %r14
	jne	.LBB0_4
.LBB0_5:
	movq	16(%r13), %rdi
	xorl	%r15d, %r15d
	xorl	%esi, %esi
	movl	$10, %edx
	callq	strtol@PLT
	movq	%rax, (%rsp)                    # 8-byte Spill
	movq	8(%r13), %r13
	movq	%r13, %rdi
	movl	$46, %esi
	callq	strrchr@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	sete	%al
	cmpq	%r13, %r12
	sete	%cl
	orb	%al, %cl
	leaq	.L.str.8(%rip), %rbp
	jne	.LBB0_8
# %bb.6:
	movq	%r12, %rdi
	movl	$47, %esi
	callq	strchr@PLT
	testq	%rax, %rax
	jne	.LBB0_8
# %bb.7:
	movq	%r12, %rdi
	movl	$92, %esi
	callq	strchr@PLT
	testq	%rax, %rax
	leaq	.L.str.8(%rip), %rbp
	cmoveq	%r12, %rbp
.LBB0_8:
	leaq	.L.str.2(%rip), %rdi
	movq	%r13, %rsi
	movq	%rbp, %rdx
	movl	%r14d, %ecx
	xorl	%eax, %eax
	callq	printf@PLT
	movq	(%rbx), %r12
	movl	%r14d, %edi
	movq	(%rsp), %rsi                    # 8-byte Reload
                                        # kill: def $esi killed $esi killed $rsi
	movq	%r12, %rdx
	movq	%rbp, %rcx
	callq	divide_fileChunks
	movq	%r12, %rdi
	callq	free@PLT
	movq	%rbx, %rdi
	callq	free@PLT
.LBB0_9:
	movl	%r15d, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.globl	read_file                       # -- Begin function read_file
	.p2align	4
	.type	read_file,@function
read_file:                              # @read_file
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	leaq	.L.str.3(%rip), %rsi
	callq	fopen@PLT
	testq	%rax, %rax
	je	.LBB1_2
# %bb.1:
	movq	%rax, %rbx
	movq	%rax, %rdi
	xorl	%esi, %esi
	movl	$2, %edx
	callq	fseek@PLT
	movq	%rbx, %rdi
	callq	ftell@PLT
	movq	%rax, %r14
	movq	%rbx, %rdi
	xorl	%esi, %esi
	xorl	%edx, %edx
	callq	fseek@PLT
	movslq	%r14d, %r14
	movl	$1, %esi
	movq	%r14, %rdi
	callq	calloc@PLT
	movq	%rax, %r15
	movl	$1, %esi
	movq	%rax, %rdi
	movq	%r14, %rdx
	movq	%rbx, %rcx
	callq	fread@PLT
	movl	$1, %edi
	movl	$16, %esi
	callq	calloc@PLT
	movq	%r15, (%rax)
	movl	%r14d, 8(%rax)
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.LBB1_2:
	.cfi_def_cfa_offset 32
	movq	stderr@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	.L.str.4(%rip), %rdi
	movl	$24, %esi
	movl	$1, %edx
	callq	fwrite@PLT
	movl	$1, %edi
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	malloc@PLT                      # TAILCALL
.Lfunc_end1:
	.size	read_file, .Lfunc_end1-read_file
	.cfi_endproc
                                        # -- End function
	.globl	get_file_extension              # -- Begin function get_file_extension
	.p2align	4
	.type	get_file_extension,@function
get_file_extension:                     # @get_file_extension
	.cfi_startproc
# %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdi, %r14
	movl	$46, %esi
	callq	strrchr@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	sete	%al
	cmpq	%r14, %rbx
	sete	%cl
	orb	%al, %cl
	leaq	.L.str.8(%rip), %r14
	jne	.LBB2_3
# %bb.1:
	movq	%rbx, %rdi
	movl	$47, %esi
	callq	strchr@PLT
	testq	%rax, %rax
	jne	.LBB2_3
# %bb.2:
	movq	%rbx, %rdi
	movl	$92, %esi
	callq	strchr@PLT
	testq	%rax, %rax
	leaq	.L.str.8(%rip), %r14
	cmoveq	%rbx, %r14
.LBB2_3:
	movq	%r14, %rax
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end2:
	.size	get_file_extension, .Lfunc_end2-get_file_extension
	.cfi_endproc
                                        # -- End function
	.globl	divide_fileChunks               # -- Begin function divide_fileChunks
	.p2align	4
	.type	divide_fileChunks,@function
divide_fileChunks:                      # @divide_fileChunks
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rcx, 24(%rsp)                  # 8-byte Spill
	movq	%rdx, 16(%rsp)                  # 8-byte Spill
	movl	%edi, 12(%rsp)                  # 4-byte Spill
	testl	%esi, %esi
	jle	.LBB3_7
# %bb.1:
	movl	%esi, %ebp
	xorl	%r12d, %r12d
	jmp	.LBB3_2
	.p2align	4
.LBB3_6:                                #   in Loop: Header=BB3_2 Depth=1
	movq	%r14, %rdi
	callq	fclose@PLT
	incl	%r12d
	cmpl	%ebp, %r12d
	je	.LBB3_7
.LBB3_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_5 Depth 2
	movl	$20, %esi
	leaq	32(%rsp), %rbx
	movq	%rbx, %rdi
	leaq	.L.str.5(%rip), %rdx
	movl	%r12d, %ecx
	movq	24(%rsp), %r8                   # 8-byte Reload
	xorl	%eax, %eax
	callq	snprintf@PLT
	movq	%rbx, %rdi
	leaq	.L.str.6(%rip), %rsi
	callq	fopen@PLT
	testq	%rax, %rax
	je	.LBB3_8
# %bb.3:                                #   in Loop: Header=BB3_2 Depth=1
	movq	%rax, %r14
	movl	12(%rsp), %eax                  # 4-byte Reload
	cltd
	idivl	%ebp
	testl	%eax, %eax
	jle	.LBB3_6
# %bb.4:                                #   in Loop: Header=BB3_2 Depth=1
	movl	%eax, %ebx
	movl	%eax, %r15d
	imull	%r12d, %ebx
	addq	16(%rsp), %rbx                  # 8-byte Folded Reload
	xorl	%r13d, %r13d
	.p2align	4
.LBB3_5:                                #   Parent Loop BB3_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movsbl	(%rbx,%r13), %edi
	movq	%r14, %rsi
	callq	fputc@PLT
	incq	%r13
	cmpq	%r13, %r15
	jne	.LBB3_5
	jmp	.LBB3_6
.LBB3_7:
	addq	$56, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB3_8:
	.cfi_def_cfa_offset 112
	movq	stderr@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	leaq	.L.str.7(%rip), %rsi
	leaq	32(%rsp), %rdx
	xorl	%eax, %eax
	callq	fprintf@PLT
	movl	$1, %edi
	callq	exit@PLT
.Lfunc_end3:
	.size	divide_fileChunks, .Lfunc_end3-divide_fileChunks
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Usage: %s <file path + extension name> <pieces to divide>\n"
	.size	.L.str, 59

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"\nFileName: %s\nFileExt: %s\nFileSize: %i"
	.size	.L.str.2, 39

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"rb"
	.size	.L.str.3, 3

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"Failed to open the file\n"
	.size	.L.str.4, 25

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"./file_part_%d%s"
	.size	.L.str.5, 17

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"wb"
	.size	.L.str.6, 3

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	"Error: Could not open the file '%s'.\n"
	.size	.L.str.7, 38

	.type	.L.str.8,@object                # @.str.8
.L.str.8:
	.zero	1
	.size	.L.str.8, 1

	.ident	"Debian clang version 21.1.8 (10)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
