import random
cond = random.randint(0,1) == 1

# ------------------------------------------------------------------------------
# Calling different bound-methods based on conditional
# ------------------------------------------------------------------------------

class CrosstalkTestX:
    def __init__(self):
        self.x = None
        self.y = None

    def setx(self, value):
        self.x = value

    def setvalue(self, value):
        self.x = value


class CrosstalkTestY:
    def __init__(self):
        self.x = None
        self.y = None

    def sety(self ,value):
        self.y = value

    def setvalue(self, value):
        self.y = value


objx = CrosstalkTestX()
objy = CrosstalkTestY()

if cond:
    func = objx.setx
else:
    func = objy.sety

# What we're testing for is whether both objects are passed as self to both methods,
# which is wrong.

func(42)


if cond:
    func = objx.setvalue
else:
    func = objy.setvalue

func(43)

# ------------------------------------------------------------------------------
# Calling methods in different ways
# ------------------------------------------------------------------------------

class A(object):
    def foo(self, arg="Default"):
        print("A.foo", self, arg)

a = A()
if cond:
    func = a.foo # `44` is passed as arg
else:
    func = A.foo # `44` is passed as self

# What we're testing for is whether a single call ends up having both `a` and `44` is
# passed as self to `A.foo`, which is wrong.

func(44)



    # in this call we currently end up mixing things, so `44` ia passed as self for
    # a.foo :| which now has TWO self arguments :O
    #
    # it might be the case that no real project actually does this, and it's certainly
    # easy to check whether a single call has multiple self arguments.
    #
    # The end result is the same as the other crosstalk tests that I made... that you
    # end up letting `self` arguments for other calls-callable paris be allowed for the
    # current callable :|
    #
    # Fundementally, DataFlowCall needs to be specified as `call x type x target`, where
    # type is (1) PlainFunctionCall (2) NormalMethodCall (3) MethodAsPlainFunctionCall
    # (4) ClassmethodCall (5) StaticmethodCall (6) ClassCall
    #
    # -- unsure whether we need a (7) unresolved call, and how all this will play
    # together with FlowSummaries. Maybe I should discuss approach with @hvitved
    #
    # Maybe should look at how JS/Ruby handles it, and just aim for least-upper-bound of
    # what they are achieving.... I'm feeling this is interesting work, but that it
    # might not end up mattering too much.
    #
    #
    # So this and the crosstalk test should be in the same location... but I don't quite
    # know how to do that :|
    #
    # Doing this refactoring also means that it's easy to expose a `DataFlowCallable
    # getCallable(DataFlowNode node)` like I promised in the start of the QLDoc for
    # DataFlowDispatch. There needs to be some indication of the type in this predicate
    # although I'm a bit unsure how to do this...
    #
    # I think I might also postpone this until super() is handled... but at least I need
    # to capture the tests somewhere proper, where it's obvious what is happening
