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


func(0) # $ call=func(..) arg[position 0]=0 qlclass=PlainFunctionCall

x = MyClass(1)

x.my_method(2) # $ call=x.my_method(..) arg[position 0]=2 arg[self]=x qlclass=NormalMethodCall
mm = x.my_method
mm(2) # $ call=mm(..) arg[position 0]=2 arg[self]=x qlclass=NormalMethodCall
MyClass.my_method(x, 2) # $ call=MyClass.my_method(..) arg[position 0]=2 arg[self]=x qlclass=MethodAsPlainFunctionCall

x.staticmethod(3) # $ call=x.staticmethod(..) arg[position 0]=3  qlclass=StaticmethodCall
MyClass.staticmethod(3) # $ call=MyClass.staticmethod(..) arg[position 0]=3 qlclass=StaticmethodCall

x.classmethod(4) # $ call=x.classmethod(..) arg[position 0]=4 qlclass=ClassmethodCall
MyClass.classmethod(4) # $ call=MyClass.classmethod(..) arg[position 0]=4 arg[self]=MyClass qlclass=ClassmethodCall

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
