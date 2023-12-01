This rule looks for functions that allocate memory, but may return without freeing it. This can occur when an operation performed on the memory block fails, and the function returns with an error before freeing the allocated block. This causes the function to leak memory and may eventually lead to software failure.

{% render "dataFlowWarning.inc.qhelp.md" %}


## Recommendation
Ensure that the function frees all dynamically allocated memory it has acquired in all circumstances, unless that memory is returned to the caller.


## Example
{% sample src="MemoryMayNotBeFreed.cpp" %}
In this example, if an exception occurs the memory allocated into `buff` is neither freed or returned. To fix this memory leak, we could add code to free `buff` to the `catch` block as follows:

{% sample src="MemoryMayNotBeFreedGood.cpp" %}
