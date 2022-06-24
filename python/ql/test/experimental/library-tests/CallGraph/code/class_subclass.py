class A(object):

    def __init__(self, arg):
        print('A.__init__', arg)
        self.arg = arg

    # name:A.some_method
    def some_method(self):
        print('A.some_method', self)

    @staticmethod
    # name:A.some_staticmethod
    def some_staticmethod():
        print('A.some_staticmethod')

    @classmethod
    # name:A.some_classmethod
    def some_classmethod(cls):
        print('A.some_classmethod', cls)


# TODO: Figure out how to annotate class instantiation (and add one here).
# Current points-to says it's a call to the class (instead of __init__/__new__/metaclass-something).
# However, current test setup uses "callable" for naming, and expects things to be Function.
a = A(42)

# calls:A.some_method
a.some_method() # $ pt,tt=A.some_method
# calls:A.some_staticmethod
a.some_staticmethod() # $ pt,tt=A.some_staticmethod
# calls:A.some_classmethod
a.some_classmethod() # $ pt,tt=A.some_classmethod

# calls:A.some_staticmethod
A.some_staticmethod() # $ pt,tt=A.some_staticmethod
# calls:A.some_classmethod
A.some_classmethod() # $ pt,tt=A.some_classmethod


# Subclass test
class B(A):
    pass

# TODO: Figure out how to annotate class instantiation (and add one here).
# Current points-to says it's a call to the class (instead of __init__/__new__/metaclass-something).
# However, current test setup uses "callable" for naming, and expects things to be Function.
b = B(42)

# calls:A.some_method
b.some_method() # $ pt=A.some_method
# calls:A.some_staticmethod
b.some_staticmethod() # $ pt=A.some_staticmethod
# calls:A.some_classmethod
b.some_classmethod() # $ pt=A.some_classmethod

# calls:A.some_staticmethod
B.some_staticmethod() # $ pt=A.some_staticmethod
# calls:A.some_classmethod
B.some_classmethod() # $ pt=A.some_classmethod


# Subclass with method override
class C(A):
    # name:C.some_method
    def some_method(self):
        print('C.some_method', self)

c = C(42)
# calls:C.some_method
c.some_method() # $ pt,tt=C.some_method


class D(object):
    # name:D.some_method
    def some_method(self):
        print('D.some_method', self)

class E(C, D):
    pass

e = E(42)
# calls:C.some_method
e.some_method() # $ pt=C.some_method

class F(D, C):
    pass

f = F(42)
# calls:D.some_method
f.some_method() # $ pt=D.some_method
