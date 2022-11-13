	.file	"main.c"
	.intel_syntax noprefix
	.text						
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"Error"
.LC2:
	.string	"%d"
.LC3:
	.string	"w"
.LC4:
	.string	"%s "
	.align 8
.LC5:
	.string	"Enter string (256 length max): "
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp			#	/ Save rbp to stack			
	mov	rbp, rsp		#	| rbp := rsp
	sub	rsp, 304		#	\ rsp -= 32
	mov	DWORD PTR -292[rbp], edi # argc
	mov	QWORD PTR -304[rbp], rsi # argv
	cmp	DWORD PTR -292[rbp], 3 # if argc == 3 go to L2
	jne	.L2
	mov	rax, QWORD PTR -304[rbp]    # /
	add	rax, 8					    # |
	mov	rax, QWORD PTR [rax]   		# |
	lea	rdx, .LC0[rip]				# | FILE *input = fopen(argv[1], "r");
	mov	rsi, rdx					# |	
	mov	rdi, rax					# |
	call	fopen@PLT				# |
	mov	QWORD PTR -8[rbp], rax		# \  input*
	cmp	QWORD PTR -8[rbp], 0		# if input == 0 go to L3
	jne	.L3
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT				# printf Error
	mov	eax, 0
	jmp	.L5							# go to L5 (return)
.L3:								
	mov	rdx, QWORD PTR -8[rbp] 		# / rdx := input 
	lea	rax, -288[rbp]				# | 
	mov	esi, 256					# | esi := sizeof(str)
	mov	rdi, rax					# | rdi := str
	call	fgets@PLT 				# \ fgets(rdi(str), esi(sizeof(str)), rdx(input))
	lea	rdx, -20[rbp]				# N1
	mov	rax, QWORD PTR -8[rbp]		
	lea	rcx, .LC2[rip]					
	mov	rsi, rcx					
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT   	# fscanf(input, "%d", &N1);
	lea	rdx, -24[rbp]				# N2
	mov	rax, QWORD PTR -8[rbp]
	lea	rcx, .LC2[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT		# fscanf(input, "%d", &N2);
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	fclose@PLT				# fclose(input);
	mov	rax, QWORD PTR -304[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC3[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT				# FILE *output = fopen(argv[2], "w");
	mov	QWORD PTR -16[rbp], rax		# output
	mov	edx, DWORD PTR -24[rbp]     # edx := N2
	mov	ecx, DWORD PTR -20[rbp]		
	lea	rax, -288[rbp]				
	mov	esi, ecx					# esi := ecx(N1)
	mov	rdi, rax					# rdi := str
	call	logic@PLT				# logic(rdi(str), esi(N1), edx(N2))
	mov	rdx, rax
	mov	rax, QWORD PTR -16[rbp]
	lea	rcx, .LC4[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT				# fprintf(output, "%s ", logic(str, N1, N2));
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	fclose@PLT				# fclose(output);
	mov	eax, 0
	jmp	.L5							# go to L5 (return)
.L2:
	lea	rax, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT				# printf("Enter string (256 length max): ");
	mov	rax, QWORD PTR stdin[rip]
	mov	rdi, rax
	call	fflush@PLT				# fflush(stdin);
	mov	rdx, QWORD PTR stdin[rip]
	lea	rax, -288[rbp]
	mov	esi, 256
	mov	rdi, rax
	call	fgets@PLT				# fgets(str, 256, stdin);
	lea	rax, -20[rbp]
	mov	rsi, rax
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT     	# scanf("%d", &N1);
	lea	rax, -24[rbp]
	mov	rsi, rax
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT     	# scanf("%d", &N2);
	mov	edx, DWORD PTR -24[rbp]     # edx := N2
	mov	ecx, DWORD PTR -20[rbp]
	lea	rax, -288[rbp]
	mov	esi, ecx					# esi := ecx(N1)
	mov	rdi, rax					# rdi := str
	call	logic@PLT				# logic(rdi(str), esi(N1), edx(N2))
	mov	rsi, rax
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT				# printf("%s ", logic(str, N1, N2));
	mov	eax, 0
.L5:
	leave							# / return and end 
	ret								# \
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
