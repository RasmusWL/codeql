This rule finds return statements that return pointers to an object allocated on the stack. The lifetime of a stack allocated memory location only lasts until the function returns, and the contents of that memory become undefined after that. Clearly, using a pointer to stack memory after the function has already returned will have undefined results.


## Recommendation
Use the functions of the `malloc` family to dynamically allocate memory on the heap for data that is used across function calls.


## Example
{% sample src="ReturnStackAllocatedMemory.cpp" %}

## References
{% cwe-references %}
