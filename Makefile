PYTHON_PKG?=python-2.7
PYTHON_CFLAGS?=$(shell pkg-config --cflags ${PYTHON_PKG})
PYTHON_LIBS?=$(shell pkg-config --libs ${PYTHON_PKG})
CFLAGS=-fPIC ${PYTHON_CFLAGS}
LDFLAGS=-shared -pthread -fPIC -fwrapv -O2 -Wall -fno-strict-aliasing -I/usr/include/python2.7 -L. 

all: foo.so

foo.so: libfoo_api.so foo.o
	gcc $(LDFLAGS) -o foo.so foo.o -lfoo_api

foo.o: foo.c
	gcc $(CFLAGS) -c foo.c

libfoo_api.so: foo_api.o
	gcc $(LDFLAGS) -o libfoo_api.so foo_api.o ${PYTHON_LIBS}

foo_api.o: foo_api.c
	gcc $(CFLAGS) -c foo_api.c

foo.c: foo.pyx
	cython foo.pyx

.PHONY: clean
clean:
	rm -f foo.o foo.c foo.so libfoo_api.so foo_api.o

.PHONY: test
test: all
	LD_LIBRARY_PATH=. python test.py
