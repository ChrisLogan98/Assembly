// ----------------------------------------------------------------------------------------
// Writes "Hello World" to the console.
// To assemble and run:
//
//     gcc callpower.c  power.s && ./a.out
//
// ----------------------------------------------------------------------------------------

#include <stdio.h>

int power(int, int);

int main() {
	printf("%d to the power of %d is %d\n",5,3,power(3,5));
	return 0;
}

