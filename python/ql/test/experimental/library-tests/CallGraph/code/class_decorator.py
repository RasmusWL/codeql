# decorated class

def my_class_decorator(cls):
    print("dummy decorator")
    return cls

@my_class_decorator # $ pt=my_class_decorator tt=my_class_decorator
class A:
    def foo(self):
        pass

a = A()
a.foo() # $ pt=A.foo MISSING: tt

class B(A):
    def bar(self):
        self.foo() # $ pt=A.foo MISSING: tt


# decorated class, unknown decorator

from some_unknown_module import unknown_class_decorator

@unknown_class_decorator
class X:
    def foo(self):
        pass

x = X()
x.foo() # $ pt=X.foo MISSING: tt

class Y(X):
    def bar(self):
        self.foo() # $ pt=X.foo MISSING: tt
