cimport foo

cdef struct foo_obj:
	int a
	int b

class Foo:
	def show_int(self, a):
		foo.show_int(a)

	def show_obj(self, a):
		foo.show_obj(a)
	
	def load_obj(self, a):
		foo.load_obj(a)
