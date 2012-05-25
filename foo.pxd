cdef extern from "foo_api.h":
	struct foo_obj:
		int a
		int b

	int show_int(int a)
	int show_obj(foo_obj *b)
	void load_obj(foo_obj *c)

