#include <stdio.h>
#include "foo_api.h"

int show_int(int a)
{
	printf("int = %d\n", a);
}

void load_obj(struct foo_obj *fo)
{
	fo->a = 5;
	fo->b = 7;
}

void show_obj(struct foo_obj *fo)
{
	printf("a = %d, b = %d\n", fo->a, fo->b);
}
