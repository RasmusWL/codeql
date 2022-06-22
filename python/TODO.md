We have gotten quite a lot of QL classes now... and their names doesn't map very well to the call types they handle.

left some TODOs in the code right now.

First item on the agenda is to, in both (datamodel, calls/test.py, and the old callgraph testing), add empty subclass and see that calls do not get resolved... obviously the current handling of `C.foo(C, arg0)` is bad, since it's not class based, but function based... and that will not handle subclass shit...

Can definitly do a grouping that is (1) plain functions (2) method calls on classes (bound-method, classmethod, staticmethod, direct call of method (non-bound))
