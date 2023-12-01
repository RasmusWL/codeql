This rule finds calls to virtual methods from within constructors and destructors. If the constructor of a derived class calls the constructor of its base type, the dynamic type of the object is the base type for the duration of the constructor call, so virtual method dispatch may yield unexpected results. The same holds for destructors.


## Recommendation
Carefully check the flagged calls to make sure they will behave as expected.


## Example
{% sample src="VirtualCallInStructor.cpp" %}

## References
* S. Meyer. *Effective C++ 3d ed.* pp 48-52. Addison Wesley. 2005. Excerpt available [here](http://www.artima.com/cppsource/nevercall.html).
{% cwe-references %}
