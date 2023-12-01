Multi-parameter constructors with default arguments can be signature-compatible with a copy constructor when their default arguments are taken into account. An example would be a constructor for `X` of the form `X(const X& rhs, int i = 0)`. A compiler will use such a constructor as a copy constructor in preference to the default member-wise copy constructor that it would otherwise generate. Since this is usually not what was intended, constructors of the form often do not provide the right semantics for copying objects of the class, making them potentially dangerous.


## Recommendation
Do not declare constructors with default arguments that are signature-compatible with a copy constructor when their default arguments are taken into account.


## Example
{% sample src="AV Rule 77.1.cpp" %}

## References
* AV Rule 77.1, *Joint Strike Fighter Air Vehicle C++ Coding Standards*. Lockheed Martin Corporation, 2005.
{% cwe-references %}
