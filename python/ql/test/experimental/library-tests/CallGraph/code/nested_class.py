class A:
    class B:
        @staticmethod
        def foo():
            print("A.B.foo")

        @staticmethod
        def bar():
            print("A.B.bar")
            A.B.foo() # $ pt,tt=A.B.foo


A.B.bar() # $ pt,tt=A.B.bar


ab = A.B()
ab.bar() # $ pt,tt=A.B.bar
