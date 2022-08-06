class Foo(object):
    def __init__(self, func):
        self.func = func

    def later(self):
        self.func() # $ pt=my_func MISSING: tt=my_func

def my_func():
    print("my_func")

foo = Foo(my_func) # $ tt=Foo.__init__
foo.later() # $ pt,tt=Foo.later
