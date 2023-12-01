{% render "../jsfNote.inc.qhelp.md" %}

This query ensures that all operators with opposites (e.g. == and !=) are both defined, and that one of them is defined in terms of the other. This just enforces the consistency of meaning of the operators.

The indicated operator either does not have its opposite defined, or both of the definitions are not in terms of the other. Not defining an operator in terms of its opposite is prone to mistakes, as it requires modification of both operators when the behavior of one changes. Deliberately defining opposite operators with behaviors that are not actual logical opposites (e.g. defining `x == y` if `x` and `y` are divisible by 2 and ` x != y ` if `x` and `y` are divisible by 3) violates the almost universal assumptions developers have on the relationship of `==` and `!=` and will lead to unnecessary confusion.


## Recommendation
Make sure that both opposite operators are defined when they are overloaded, and ensure that one of the overloads is defined in terms of the other.


## Example
{% sample src="AV Rule 85.cpp" %}

## References
* AV Rule 85, *Joint Strike Fighter Air Vehicle C++ Coding Standards*. Lockheed Martin Corporation, 2005.
{% cwe-references %}
