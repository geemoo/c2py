CFLAGS=-I/usr/include/python2.7 -fPIC
LDFLAGS=-shared -pthread -fPIC -fwrapv -O2 -Wall -fno-strict-aliasing -I/usr/include/python2.7 -L.

all: foo.so

foo.so: libfoo_api.so foo.o
	gcc $(LDFLAGS) -o foo.so foo.o -lfoo_api

foo.o: foo.c
	gcc $(CFLAGS) -c foo.c

libfoo_api.so: foo_api.o
	gcc $(LDFLAGS) -o libfoo_api.so foo_api.o

foo_api.o: foo_api.c
	gcc $(CFLAGS) -c foo_api.c

foo.c: foo.pyx
	cython foo.pyx

.PHONY: clean
clean:
	rm -f foo.o foo.c foo.so libfoo_api.so foo_api.o

