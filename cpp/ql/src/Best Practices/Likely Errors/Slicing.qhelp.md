This query finds assignments of a non-reference instance of a derived type to a variable of the base type where the derived type has more fields than the base. These assignments slice off all the fields added by the derived type, and can cause unexpected state when accessed as the derived type.


## Recommendation
Change the type of the variable at the left-hand side of the assignment to the subclass.


## Example
{% sample src="Slicing.cpp" %}

## References
* Wikipedia: [Object slicing](http://en.wikipedia.org/wiki/Object_slicing).
* DevX.com: [Slicing in C++](http://www.devx.com/tips/Tip/14570).
{% cwe-references %}
