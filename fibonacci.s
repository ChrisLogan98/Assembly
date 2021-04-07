#------------------------------------------------
# This programs calculates the fibonacci sequence and is currently written in Assembly
# DO NOT RUN BY ITSELF, PLEASE RUN IT CONCURRENTLY WITH fibonacci.c
# To assemble and run, 
#	
#	gcc fibonacci.c fibonacci.s && ./a.out
#
#------------------------------------------------
	.global fibonacci

format:
	.asciz	"%5ld\n"

	.text
fibonacci:
	
	mov	$0, %rax	#starts sequence at 0
	mov	$1, %rcx	#adds 1 to rcx register
	jmp	loop
	
loop:
	sub	$2, %rsp	#subtracts 2 from rsp register
	cmp	%rsp, 0		#if rsp is equal to 0
	jl	end		#jump to end
	add	%rcx, %rax	#add value in rcx to value in rax
	add	%rax, %rcx	#add value in rax to value in rcx
	jmp	loop

end:
	cmp	%rsp, 1		#compares rsp to 1
	jne	endEven		#jumps if rsp is not equal to 1
	push	%rax		#pushs rax register to save it and returns
	ret

endEven:
	push	%rcx		#pushs rcx register to save it and returns
	ret		
