	.file	"logic.c"
	.intel_syntax noprefix
	.text
	.globl	logic
	.type	logic, @function
logic:
	push	rbp					#	/ Save rbp to stack	
	mov	rbp, rsp				#	\ rbp := rsp
	mov	QWORD PTR -24[rbp], rdi	#	save rdi(str)
	mov	DWORD PTR -28[rbp], esi	#	save esi(N1)
	mov	DWORD PTR -32[rbp], edx	#	save esi(N2)
	jmp	.L2
.L3:							# swapping str[N1] and str[N2] 
	mov	eax, DWORD PTR -28[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	mov	BYTE PTR -1[rbp], al
	mov	eax, DWORD PTR -32[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR -28[rbp]
	movsx	rcx, edx
	mov	rdx, QWORD PTR -24[rbp]
	add	rdx, rcx
	movzx	eax, BYTE PTR [rax]
	mov	BYTE PTR [rdx], al
	mov	eax, DWORD PTR -32[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rdx, rax
	movzx	eax, BYTE PTR -1[rbp]
	mov	BYTE PTR [rdx], al
	add	DWORD PTR -28[rbp], 1
	sub	DWORD PTR -32[rbp], 1
.L2:							# while header
	mov	edx, DWORD PTR -28[rbp]
	mov	eax, DWORD PTR -32[rbp]
	add	eax, edx
	mov	edx, eax
	shr	edx, 31
	add	eax, edx
	sar	eax
	cmp	DWORD PTR -28[rbp], eax # if (N1 <= (N1 + N2) / 2) gp to L3
	jl	.L3
	mov	rax, QWORD PTR -24[rbp] # return str in rax
	pop	rbp						
	ret
