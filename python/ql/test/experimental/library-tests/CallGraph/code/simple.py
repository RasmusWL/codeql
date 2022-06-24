# name:foo
def foo():
    print("foo called")


indirect_foo = foo


# name:bar
def bar():
    print("bar called")


# name:lam
lam = lambda: print("lambda called")


# calls:foo
foo() # $ pt,tt=foo
# calls:foo
indirect_foo() # $ pt,tt=foo
# calls:bar
bar() # $ pt,tt=bar
# calls:lam
lam() # $ pt,tt=lambda[simple.py:15:7]

# python -m trace --trackcalls simple.py
