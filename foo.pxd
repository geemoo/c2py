cdef extern from "foo_api.h":
	struct foo_obj:
		int a
		int b

	int show_int(int)
	int show_obj(struct foo_obj *)
	void load_obj(struct foo_obj *)

