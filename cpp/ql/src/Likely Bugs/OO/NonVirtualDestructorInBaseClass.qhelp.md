This rule finds classes with virtual functions but no virtual destructor. Deleting a class without a virtual destructor will only call the destructor of the type of the pointer being deleted. This can cause a defect if the pointer type is a base type while the object instance is a derived type.


## Recommendation
Make sure that all classes with virtual functions also have a virtual destructor, especially if other classes derive from them.


## Example
{% sample src="NonVirtualDestructorInBaseClass.cpp" %}

## References
* S. Meyers. *Effective C++ 3d ed.* pp 40-44. Addison-Wesley Professional, 2005.
* [When should your destructor be virtual?](https://devblogs.microsoft.com/oldnewthing/20040507-00/?p=39443)
{% cwe-references %}
