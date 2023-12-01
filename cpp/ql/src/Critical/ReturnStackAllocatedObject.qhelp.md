This query finds return statements that return pointers to an object allocated on the stack. The lifetime of a stack allocated memory location only lasts until the function returns, and the contents of that memory become undefined after that. Clearly, using a pointer to stack memory after the function has already returned will have undefined results.

{% render "pointsToWarning.inc.qhelp.md" %}


## Recommendation
Do not return pointers to stack memory locations. Instead, create an output parameter, or create a heap-allocated buffer. You can then copy the contents of the stack-allocated memory to the heap-allocated buffer and return that location instead.


## Example
The example below the reference to `myRecord` is useful only while the containing function is running. If you need to access the object outside this function, either create an output parameter with its value, or copy the object into heap-allocated memory.

{% sample src="ReturnStackAllocatedObject.cpp" %}

## References
* cplusplus.com: [Pointers](http://www.cplusplus.com/doc/tutorial/pointers/).
* The craft of coding: [Memory in C - the stack, the heap, and static](https://craftofcoding.wordpress.com/2015/12/07/memory-in-c-the-stack-the-heap-and-static/).
{% cwe-references %}
