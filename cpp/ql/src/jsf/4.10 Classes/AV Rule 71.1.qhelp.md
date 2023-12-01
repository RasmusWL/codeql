This rule finds calls to virtual functions from a constructor or destructor that may resolve to a different function than was intended. When instantiating a derived class, the resolution of a virtual function call depends on the type that defines the constructor/destructor *that is currently running*, not the class that is being instantiated. This is to prevent the calling of functions in the derived class that rely on fields declared in the derived class. The values of such fields are undefined until the constructor of the derived class is invoked *after* the constructor of the base class. Values declared in the derived class are likewise destructed *prior* to invocation of the destructor of the base class.

The indicated function call is a call to a virtual function in a constructor or destructor, which will most likely not call the intended function, or if correct would be difficult to interpret without knowledge of the class' inheritance graph.


## Recommendation
Do not call virtual functions from the constructor or destructor. Change the virtual function in the base into a non-virtual function and pass any required parameters from the derived classes, or simply perform initialization that requires a virtual function after construction/before destruction.


## Example
{% sample src="AV Rule 71.1.cpp" %}

## References
* AV Rule 71.1, *Joint Strike Fighter Air Vehicle C++ Coding Standards*. Lockheed Martin Corporation, 2005.
* S. Meyers. *Effective C++ 3d ed.* pp 48-52. Addison-Wesley Professional, 2005.
* [OOP50-CPP. Do not invoke virtual functions from constructors or destructors](https://www.securecoding.cert.org/confluence/display/cplusplus/OOP50-CPP.+Do+not+invoke+virtual+functions+from+constructors+or+destructors)
{% cwe-references %}
