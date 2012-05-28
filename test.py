#!/usr/bin/python

import foo

bar = foo.Foo()
bar.show_int(5)

print "Creating object..."
moo = foo.FooObj()
bar.show_obj(moo)

print "Assigning members..."
moo.a = 1
moo.b = 2
bar.show_obj(moo)

print "Load values from lib..."
bar.load_obj(moo)
bar.show_obj(moo)

