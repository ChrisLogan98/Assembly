// ----------------------------------------------------------------------------------------
// Writes "Hello World" to the console.
// To assemble and run:
//
//     gcc -std=c99 sumarray.c && ./a.out
//
// ----------------------------------------------------------------------------------------

#include <stdio.h>


int myarray(int [], int);

int main() {
	int intarray [] = {5,4,3,2,1};
	int arraysize = 5;
	printf("Array sum is %d\n",myarray(intarray, arraysize));
	printf("Array items are\n");
	for (int i = 0; i< arraysize; i++) {
		printf("%d ",intarray[i]);
	}
	printf("\n");
	return 0;
}


