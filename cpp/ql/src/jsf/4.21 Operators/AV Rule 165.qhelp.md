{% render "../jsfNote.inc.qhelp.md" %}

This query finds unsigned values that are being negated. Behavior is undefined in such cases. Negating integer values produces the two's complement of that number, which cannot represent negative values of large unsigned values (values where the sign bit is used) and are most likely to be interpreted as a smaller positive integer instead.


## Recommendation
Do not negate unsigned values.


## Example
{% sample src="AV Rule 165.cpp" %}

## References
* AV Rule 165, *Joint Strike Fighter Air Vehicle C++ Coding Standards*. Lockheed Martin Corporation, 2005.
{% cwe-references %}
