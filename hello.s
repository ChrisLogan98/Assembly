# ----------------------------------------------------------------------------------------
# Writes "Hello World" to the console.
# To assemble and run:
#
#     gcc -no-pie hello.s && ./a.out
#
# ----------------------------------------------------------------------------------------
        .global main

message:
	.asciz "Hello World\n"		# asciz puts a 0x00 byte at the end to end string
	.asciz "This is really cool\n"	

	.text
main:					# This is called by C library's startup code
	push %rbx
	lea message(%rip), %rdi		# Put message in %rdi
	xor %eax, %eax			# Clear AL
	call printf			# printf(message)
	pop %rbx
	ret				# Return to C library code

