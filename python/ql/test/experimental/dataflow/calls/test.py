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

    @staticmethod # $ arg[position 0]=FunctionExpr call=staticmethod(..) qlclass=NormalCall
    def staticmethod(arg):
        pass

    @classmethod # $ arg[position 0]=FunctionExpr call=classmethod(..) qlclass=NormalCall
    def classmethod(cls, arg):
        pass

    def __getitem__(self, key):
        pass


func(0) # $ call=func(..) qlclass=NormalCall arg[position 0]=0

x = MyClass(1) # $ call=MyClass(..) qlclass=NormalCall arg[position 0]=1

x.my_method(2) # $ call=x.my_method(..) qlclass=NormalCall arg[position 0]=2 MISSING: arg[self]=x
mm = x.my_method
mm(2) # $ call=mm(..) qlclass=NormalCall arg[position 0]=2 MISSING: arg[self]=x

x.staticmethod(3) # $ arg[position 0]=3 call=x.staticmethod(..) qlclass=NormalCall
MyClass.staticmethod(3) # $ arg[position 0]=3 call=MyClass.staticmethod(..) qlclass=NormalCall

x.classmethod(4) # $ arg[position 0]=4 call=x.classmethod(..) qlclass=NormalCall
MyClass.classmethod(4) # $ arg[position 0]=4 call=MyClass.classmethod(..) qlclass=NormalCall

x[5] # $ MISSING: call=x[5] qlclass=SpecialCall arg[self]=x arg[position 0]=5


try:
    # These are included to show how we handle absent things with points-to where
    # `mypkg.foo` is a `missing module variable`, but `mypkg.subpkg.bar` is compeltely
    # ignored.
    import mypkg
    mypkg.foo(42) # $ call=mypkg.foo(..) qlclass=NormalCall arg[position 0]=42
    mypkg.subpkg.bar(43) # $ call=mypkg.subpkg.bar(..) qlclass=NormalCall arg[position 0]=43
except:
    pass
