{% render "../jsfNote.inc.qhelp.md" %}

This query highlights identifiers in an inner scope that hide (have the same name as) an identifier in an outer scope. This should be avoided as it can cause confusion about the actual variable being used in an expression.


## Recommendation
Change the name of the identifier so it does not hide another on an outer scope.


## Example
{% sample src="AV Rule 135.cpp" %}

## References
* AV Rule 135, *Joint Strike Fighter Air Vehicle C++ Coding Standards*. Lockheed Martin Corporation, 2005.
{% cwe-references %}
