//---------------------------------------------------
// This program creates a fibonacci sequence and allows users to choose the digit they want
// Ex: User chose 6, the 6th digit is 8
// To assemble and hopefully not catch fire,
//
//	gcc fibonacci.c fibonacci.s && ./a.out
//
//---------------------------------------------------

/* standard I/O library */
#include <stdio.h>
#include <stdint.h>

int fibonacci(int);

int main(){

	int n;
	int d;
	
	printf("This program allows for users to generate a fibonacci sequence\n");
	printf("The user can select the nth number to be displayed\n");
	printf("Please select the number you want to be displayed\n");
	scanf("%d", &n);	
	
	printf("%d is the %d th value of the fibonacci sequence\n", n, fibonacci(n));
	
	return 0;
}

