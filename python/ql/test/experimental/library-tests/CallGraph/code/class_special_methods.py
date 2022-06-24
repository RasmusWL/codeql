class B(object):

    def __init__(self, arg):
        print('B.__init__', arg)
        self.arg = arg

    def __str__(self):
        print('B.__str__')
        return 'B (arg={})'.format(self.arg)

    def __add__(self, other):
        print('B.__add__')
        if isinstance(other, B):
            return B(self.arg + other.arg)
        return B(self.arg + other)

b = B(1)

print(str(b))
# this calls `str(b4)` inside
print(b)



b2 = B(2)

# __add__ is called
b + b2
b + 100
