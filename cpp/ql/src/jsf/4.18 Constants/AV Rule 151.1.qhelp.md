{% render "../jsfNote.inc.qhelp.md" %}

This query highlights string literals that are assigned to a non-`const` variable. String literals should not be changed, since they are usually stored in the data section, and depending on the architecture, writing to the data section will cause undefined behavior, such as memory corruption or memory write error.


## Recommendation
Only assign string literals to `const` variables. In general, using `const` to indicate values that do not change is good practice, as it provides a compile-time check and when used on function parameters gives an indication of the function's expected behavior.


## Example
{% sample src="AV Rule 151.1.cpp" %}

## References
* AV Rule 151.1, *Joint Strike Fighter Air Vehicle C++ Coding Standards*. Lockheed Martin Corporation, 2005.
{% cwe-references %}
