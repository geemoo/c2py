
all: foo.so

foo.so: libfoo_api.so foo.o
	gcc -shared -pthread -fPIC -fwrapv -O2 -Wall -fno-strict-aliasing -I/usr/include/python2.7 -L. -o foo.so foo.o -lfoo_api

foo.o: foo.c
	gcc -I/usr/include/python2.7 -c foo.c

libfoo_api.so: foo_api.o
	gcc -shared -pthread -fPIC -fwrapv -O2 -Wall -fno-strict-aliasing -o libfoo_api.so foo_api.o

foo_api.o: foo_api.c
	gcc -c foo_api.c

foo.c: foo.pyx
	cython foo.pyx

.PHONY: clean
clean:
	rm -f foo.o foo.c foo.so libfoo_api.so foo_api.o

