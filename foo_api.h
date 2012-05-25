#ifndef __FOO_API_H__
#define __FOO_API_H__
struct foo_obj {
	int a;
	int b;
};

int show_int(int);
void load_obj(struct foo_obj *);
void show_obj(struct foo_obj *);

#endif
