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

    @staticmethod
    def staticmethod(arg):
        pass

    @classmethod
    def classmethod(cls, arg):
        pass

    def __getitem__(self, key):
        pass


func(0) # $ call=func(..) qlclass=FunctionCall arg[position 0]=0

x = MyClass(1)

x.my_method(2) # $ call=x.my_method(..) qlclass=InstanceMethodCall arg[position 0]=2 arg[self]=x
mm = x.my_method
mm(2) # $ call=mm(..) qlclass=InstanceMethodCall arg[position 0]=2 arg[self]=x

x.staticmethod(3) # $ arg[position 0]=3 call=x.staticmethod(..) qlclass=InstanceMethodCall arg[self]=x
MyClass.staticmethod(3) # $ MISSING: arg[position 0]=3 call=MyClass.staticmethod(..)

x.classmethod(4) # $ arg[position 0]=4 call=x.classmethod(..) qlclass=InstanceMethodCall SPURIOUS: arg[self]=x
MyClass.classmethod(4) # $ MISSING: arg[position 0]=4 call=MyClass.classmethod(..)

x[5] # $ MISSING: call=x[5] qlclass=SpecialCall arg[self]=x arg[position 0]=5


try:
    # These are included to show whether we have a DataFlowCall for things we can't
    # resolve. Both are interesting since with points-to we used to have a DataFlowCall
    # for _one_ but not the other
    import mypkg
    mypkg.foo(42)
    mypkg.subpkg.bar(43)
except:
    pass
