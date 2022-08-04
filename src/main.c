#include "summer.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[])
{
	if (argc != 3)
		exit(1);
	int a = atoi(argv[1]);
	int b = atoi(argv[2]);
	printf("%d\n", sum(a, b));
}
