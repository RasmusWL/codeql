This rule finds calls to pure virtual member functions in constructors and destructors. When executing the body of a constructor of class `T`, the virtual table of `T` refers to the virtual table of one of `T`'s base classes. This can produce unexpected behavior, including program abort that can lead to denial of service attacks. The same problem exists during destruction of an object.


## Recommendation
Do not rely on virtual dispatch in constructors and destructors. Instead, each class should be responsible for acquiring and releasing its resources. If a base class needs to refer to a derived class during initialization, use the Dynamic Binding During Initialization idiom.


## Example
{% sample src="UnsafeUseOfThis.cpp" %}

## References
* ISO C++ FAQ: [When my base class's constructor calls a virtual function on its this object, why doesn't my derived class's override of that virtual function get invoked?](https://isocpp.org/wiki/faq/strange-inheritance#calling-virtuals-from-ctors)
* SEI CERT C++ Coding Standard [OOP50-CPP. Do not invoke virtual functions from constructors or destructors](https://wiki.sei.cmu.edu/confluence/display/cplusplus/OOP50-CPP.+Do+not+invoke+virtual+functions+from+constructors+or+destructors)
* ISO C++ FAQ: [Okay, but is there a way to simulate that behavior as if dynamic binding worked on the this object within my base class's constructor?](https://isocpp.org/wiki/faq/strange-inheritance#calling-virtuals-from-ctor-idiom)
{% cwe-references %}
