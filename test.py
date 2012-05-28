#!/usr/bin/python

import foo

bar = foo.Foo()
bar.show_int(5)

moo = foo.FooObj()
moo.a = 1
moo.b = 2
bar.show_obj(moo)
