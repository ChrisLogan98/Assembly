#------------------------------------------------------------------
# This program can multiply numbers by the power of 3. More numbers could be added
# but for the time being, you can only multiple a given number 3 times. 
# If you are daring enough to change anything or add more options, go ahead.
# Just be sure to keep track of the registers that are being used.
#	
#	To compile and run, type this into the terminal	
#	
#	gcc -no-pie power.s && ./a.out
#
#------------------------------------------------------------------
	.global main

format:
	.asciz  "%5ld\n"

	.text
main:
	push	%rbx			#since rbx will be used, it has to be saved	
	
	#NOTE: ALL THESE NUMBERS CAN BE CHANGED. DO SO AT OWN RISK 
	mov	$5, %rax		#move given number to rax register
	imul	%rax, %rax		#multiply rax register with itself to get the product of the two numbers (CALCULATES BASE)
	mov	$5, %rbp		#move other number to rbp register
	imul	%rbp, %rax		#multiply rbp register with rax register (ADDS POWER TO BASE)
		
power:
	push	%rax			#pushes rax register to save it
	
	lea format(%rip), %rdi		#set first parameter (format)
	mov %rax, %rsi			#set second parameter (current_number)
	xor %eax, %eax			#clears eax register
	
	call 	printf			#calls printf function to display text on screen
			
	pop 	%rax			#restore rax to top of stack
					
	pop 	%rbx			#pops rbx back on stack before returning
	ret