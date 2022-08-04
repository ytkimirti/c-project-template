#include <criterion/criterion.h>

#include "../src/summer.h"

int *a;
int *b;

void suitesetup(void)
{
	a = malloc(sizeof(int));
	b = malloc(sizeof(int));
}

void suiteteardown(void)
{
	free(a);
	free(b);
}

TestSuite(sumtests, .init=suitesetup, .fini=suiteteardown);

Test(sumtests, small) {
	*a = 5;
	*b = 8;
	cr_expect(sum(*a, *b) == 13, "5 + 8 must be 13");
}

Test(sumtests, mid) {
	*a = 12;
	*b = 23;
	cr_expect(sum(*a, *b) == 35, "12 + 23 must be 35");
}
