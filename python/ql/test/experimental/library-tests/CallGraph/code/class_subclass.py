class A(object):

    def __init__(self, arg):
        print('A.__init__', arg)
        self.arg = arg

    def some_method(self):
        print('A.some_method', self)

    @staticmethod
    def some_staticmethod():
        print('A.some_staticmethod')

    @classmethod
    def some_classmethod(cls):
        print('A.some_classmethod', cls)


# TODO: Figure out how to annotate class instantiation (and add one here).
# Current points-to says it's a call to the class (instead of __init__/__new__/metaclass-something).
# However, current test setup uses "callable" for naming, and expects things to be Function.
a = A(42)

a.some_method() # $ pt,tt=A.some_method
a.some_staticmethod() # $ pt,tt=A.some_staticmethod
a.some_classmethod() # $ pt,tt=A.some_classmethod

A.some_staticmethod() # $ pt,tt=A.some_staticmethod
A.some_classmethod() # $ pt,tt=A.some_classmethod


# Subclass test
class B(A):
    pass

# TODO: Figure out how to annotate class instantiation (and add one here).
# Current points-to says it's a call to the class (instead of __init__/__new__/metaclass-something).
# However, current test setup uses "callable" for naming, and expects things to be Function.
b = B(42)

b.some_method() # $ pt,tt=A.some_method
b.some_staticmethod() # $ pt,tt=A.some_staticmethod
b.some_classmethod() # $ pt,tt=A.some_classmethod

B.some_staticmethod() # $ pt,tt=A.some_staticmethod
B.some_classmethod() # $ pt,tt=A.some_classmethod


# Subclass with method override
class C(A):
    def some_method(self):
        print('C.some_method', self)

c = C(42)
c.some_method() # $ pt,tt=C.some_method


class D(object):
    def some_method(self):
        print('D.some_method', self)

class E(C, D):
    pass

e = E(42)
e.some_method() # $ pt,tt=C.some_method SPURIOUS: tt=D.some_method

class F(D, C):
    pass

f = F(42)
f.some_method() # $ pt,tt=D.some_method SPURIOUS: tt=C.some_method

# ------------------------------------------------------------------------------
# self/cls in methods
# ------------------------------------------------------------------------------

class Base(object):
    def foo(self):
        print('Base.foo')

    def bar(self):
        print('Base.bar')

    def call_stuff(self):
        self.foo() # $ pt,tt=Base.foo pt,tt=Sub.foo pt,tt=Mixin.foo
        self.bar() # $ pt,tt=Base.bar

        self.sm() # $ pt,tt=Base.sm
        self.cm() # $ pt,tt=Base.cm

        self.sm2() # $ pt,tt=Base.sm2 pt,tt=Sub.sm2
        self.cm2() # $ pt,tt=Base.cm2 pt,tt=Sub.cm2

    @staticmethod
    def sm():
        print("Base.sm")

    @classmethod
    def cm(cls):
        print("Base.cm")

    @staticmethod
    def sm2():
        print("Base.sm2")

    @classmethod
    def cm2(cls):
        print("Base.cm2")

    @classmethod
    def call_from_cm(cls):
        cls.sm() # $ pt,tt=Base.sm
        cls.cm() # $ pt,tt=Base.cm

        cls.sm2() # $ pt,tt=Base.sm2 pt,tt=Sub.sm2
        cls.cm2() # $ pt,tt=Base.cm2 pt,tt=Sub.cm2

base = Base()
print("! base.call_stuff()")
base.call_stuff() # $ pt,tt=Base.call_stuff
print("! Base.call_from_cm()")
Base.call_from_cm() # $ pt,tt=Base.call_from_cm

class Sub(Base):
    def foo(self):
        print("Sub.foo")

    def foo_on_super(self):
        sup = super()
        sup.foo() # $ pt=Base.foo MISSING: tt=Base.foo

    def also_call_stuff(self):
        self.sm() # $ pt,tt=Base.sm
        self.cm() # $ pt,tt=Base.cm

        self.sm2() # $ pt,tt=Sub.sm2
        self.cm2() # $ pt,tt=Sub.cm2

    @staticmethod
    def sm2():
        print("Sub.sm2")

    @classmethod
    def cm2(cls):
        print("Sub.cm2")

sub = Sub()
print("! sub.foo_on_super()")
sub.foo_on_super() # $ pt,tt=Sub.foo_on_super
print("! sub.call_stuff()")
sub.call_stuff() # $ pt,tt=Base.call_stuff
print("! sub.also_call_stuff()")
sub.also_call_stuff() # $ pt,tt=Sub.also_call_stuff
print("! Sub.call_from_cm()")
Sub.call_from_cm() # $ pt,tt=Base.call_from_cm


class Mixin(object):
    def foo(self):
        print("Mixin.foo")

class SubWithMixin(Mixin, Base):
    # the ordering here means that in Base.call_stuff, the call to self.foo will go to Mixin.foo
    pass

swm = SubWithMixin()
print("! swm.call_stuff()")
swm.call_stuff() # $ pt,tt=Base.call_stuff
