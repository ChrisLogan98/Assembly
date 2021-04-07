# ----------------------------------------------------------------------------------------
# Adds numbers 10 to 1 and prints the sum to the console.
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

	mov     $0, %ecx		# ecx will countdown from 0 to 10
	mov     $55, %rax		# set rax to 55 (our difference)
printandadd:
	sub     %rcx, %rax		# Subtract to rcx to rax (difference)

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

	inc     %ecx			# count up
	mov	$10, %rbp		# move 10 to empty register (rbp)
	cmp	%rax, %rbx		# compare rax to rbp
	jne     printandadd	   	# if ecx is equal to 10, stop the loop

	pop     %rbx			# restore rbx before returning
	ret

