This rule finds classes that define a non-virtual destructor, yet they have derived classes that also define a non-virtual destructor. This can prevent proper cleanup of resources as only the destructor of the type of the variable will be called (instead of the type of the object instance).


## Recommendation
Make the destructor virtual.


## Example
{% sample src="NonVirtualDestructor.cpp" %}

## References
* R. Chen, [When should your destructor be virtual?](https://devblogs.microsoft.com/oldnewthing/20040507-00/?p=39443).
* S. Meyers. *Effective C++ 3d ed.* pp 40-44. Addison-Wesley Professional, 2005.
{% cwe-references %}
