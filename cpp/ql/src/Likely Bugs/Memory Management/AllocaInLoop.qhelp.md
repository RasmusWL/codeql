The `alloca` macro allocates memory by expanding the current stack frame. Invoking `alloca` within a loop may lead to a stack overflow because the memory is not released until the function returns.


## Recommendation
Consider invoking `alloca` once outside the loop, or using `malloc` or `new` to allocate memory on the heap if the allocation must be done inside the loop.


## Example
The variable `path` is allocated inside a loop with `alloca`. Consequently, storage for all copies of the path is present in the stack frame until the end of the function.

{% sample src="AllocaInLoopBad.cpp" %}
In the revised example, `path` is allocated with `malloc` and freed at the end of the loop.

{% sample src="AllocaInLoopGood.cpp" %}

## References
* Linux Programmer's Manual: [ALLOCA(3)](http://man7.org/linux/man-pages/man3/alloca.3.html).
{% cwe-references %}
