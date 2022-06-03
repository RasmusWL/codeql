# A very basic test of DataFlowCall
#
# see `coverage/argumentRoutingTest.ql` for a more in depth test of argument routing
# handling.

def func(arg):
    pass


class MyClass(object):
    def __init__(self, arg):
        pass

    def my_method(self, arg):
        pass

    def __getitem__(self, key):
        pass


func("foo") # $ call=func(..) qlclass=NormalCall arg[position 0]="foo"
x = MyClass(1) # $ call=MyClass(..) qlclass=NormalCall arg[position 0]=1
x.my_method(2) # $ call=x.my_method(..) qlclass=NormalCall arg[position 0]=2 MISSING: arg[self]=x
mm = x.my_method
mm(2) # $ call=mm(..) qlclass=NormalCall arg[position 0]=2 MISSING: arg[self]=x
x[3] # $ MISSING: call=x[3] qlclass=SpecialCall arg[position 0]=x arg[position 1]=3


try:
    # These are included to show how we handle absent things with points-to where
    # `mypkg.foo` is a `missing module variable`, but `mypkg.subpkg.bar` is compeltely
    # ignored.
    import mypkg
    mypkg.foo(42) # $ call=mypkg.foo(..) qlclass=NormalCall arg[position 0]=42
    mypkg.subpkg.bar(43) # $ call=mypkg.subpkg.bar(..) qlclass=NormalCall arg[position 0]=43
except:
    pass
