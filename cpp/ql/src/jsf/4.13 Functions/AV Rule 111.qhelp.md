{% render "../jsfNote.inc.qhelp.md" %}

This query highlights return statements that return pointers to an object allocated on the stack. The lifetime of a stack allocated memory location only lasts until the function returns, , and the contents of that memory become undefined after that. Clearly, using a pointer to stack memory after the function has already returned will have undefined results.

{% render "../../Critical/pointsToWarning.inc.qhelp.md" %}


## Recommendation
Do not return pointers to stack memory locations. Instead, create an output parameter, or create a heap-allocated buffer, copy the contents of the stack allocated memory to that buffer and return that instead.


## Example
{% sample src="AV Rule 111.cpp" %}

## References
* AV Rule 111, *Joint Strike Fighter Air Vehicle C++ Coding Standards*. Lockheed Martin Corporation, 2005.
{% cwe-references %}
