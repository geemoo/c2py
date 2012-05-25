cdef extern from "foo_api.h":
	int show_int(int)
	int show_obj(struct foo_obj *)
	void load_obj(struct foo_obj *)

