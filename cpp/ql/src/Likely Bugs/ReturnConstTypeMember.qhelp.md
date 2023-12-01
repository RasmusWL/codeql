This rule finds member functions with a superfluous `const` qualifier on their return type. This might be caused by confusion about how to declare a `const` method. In particular, when C++11 trailing return types are used, it becomes much easier to mis-declare a `const` method by putting `const` on the wrong side of `->`.


## Recommendation
The superfluous `const` qualifier should be removed, as it serves no purpose. If the return type contains embedded qualifiers, then care should be taken to remove only the superfluous one.

Alternatively, if the intention was to have a `const` method, then the qualifier should be moved to immediately after the argument list.


## Example
{% sample src="ReturnConstTypeMember.cpp" %}
