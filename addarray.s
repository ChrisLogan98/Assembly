# ----------------------------------------------------------------------------------------
# Adds numbers 1 to 10 backwards and prints the sum to the console.
# To assemble and run:
#
#     gcc -no-pie sum.s && ./a.out
#
# ----------------------------------------------------------------------------------------

	.global myarray

	.data
intarray:
	.quad  4, 3, 2, 1
intconst:
	.quad 5

	.text
myarray:
	lea	(%rdi),%r8		#load array to register
	mov	intconst,%r9		#load integer to register
	mov	%rsi,%r12		#load array size to register
	mov	$0,%r10			#initialize index
addtoarray:
	add	%r9, (%r8,%r10,4)	#add integer to array[i]
	inc	%r10
	cmp	%r12,%r10		#check for end of array
	jne	addtoarray

	mov	$0,%r10			#initialize index
	mov	$0,%r11			#initialize sum
sumarray:
	add	(%r8,%r10,4),%r11	#add integer to array[i]
	inc	%r10
	cmp	%r12,%r10		#check for end of array
	jne	sumarray

	mov	%r11, %rax
	ret

