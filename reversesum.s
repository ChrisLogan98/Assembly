# ----------------------------------------------------------------------------------------
# Adds numbers 1 to 10 backwards and prints the sum to the console.
# To assemble and run:
#
#     gcc -no-pie sum.s && ./a.out
#
# ----------------------------------------------------------------------------------------
	.global main


format:
	.asciz  "%5ld\n"

	.text
main:
	push    %rbx			# we have to save this since we use it

	mov     $10, %ecx		# ecx will countdown from 10 to 0
	mov     $0, %rax		# set rax to 0 (our sum)
printandadd:
	add     %rcx, %rax		# Add to rcx to rax (sum)

	# We need to call printf, but we are using eax, ebx, and ecx.  printf
	# may destroy eax and ecx so we will save these before the call and
	# restore them afterwards.
	push    %rax			# caller-save register
	push    %rcx			# caller-save register

	lea format(%rip), %rdi		# set 1st parameter (format)
	mov %rax, %rsi			# set 2nd parameter (current_number)
	xor %eax, %eax			# clear AL

	# Stack is already aligned because we pushed three 8 byte registers
	call    printf		  	# printf(format, current_number)

	pop     %rcx			# restore caller-save register
	pop     %rax			# restore caller-save register

	dec     %ecx			# count down
	jnz     printandadd	   	# if ecx is not zero (i.e. if not done counting jump to print)

	pop     %rbx			# restore rbx before returning
	ret

