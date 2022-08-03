# ==============================================================================
# function
# ==============================================================================

def call_func(f):
    f() # $ pt=my_func pt=test_func.inside_test_func MISSING: tt=my_func tt=test_func.inside_test_func


def my_func():
    print("my_func")

call_func(my_func) # $ pt,tt=call_func


def test_func():
    def inside_test_func():
        print("inside_test_func")

    call_func(inside_test_func) # $ pt,tt=call_func

test_func() # $ pt,tt=test_func


# ==============================================================================
# class
# ==============================================================================

def class_func(cls):
    cls.sm() # $ pt=MyClass.sm # $ MISSING: tt=MyClass.sm tt=InsideTestFunc.sm
    cls(42) # $ MISSING: tt=MyClass.__init__ tt=InsideTestFunc.__init__


class MyClass:
    def __init__(self, arg):
        print(self, arg)

    @staticmethod
    def sm():
        print("MyClass.staticmethod")

class_func(MyClass) # $ pt,tt=class_func


def test_class():
    class InsideTestFunc:
        def __init__(self, arg):
            print(self, arg)

        @staticmethod
        def sm():
            print("InsideTestFunc.staticmethod")

    class_func(InsideTestFunc) # $ pt,tt=class_func

test_class() # $ pt,tt=test_class
