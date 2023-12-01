When releasing memory in a catch block, be sure that the memory was allocated and has not already been released.


## Example
The following example shows erroneous and fixed ways to use exception handling.

{% sample src="DangerousUseOfExceptionBlocks.cpp" %}

## References
* CERT C Coding Standard: [EXP34-C. Do not dereference null pointers](https://wiki.sei.cmu.edu/confluence/display/c/EXP34-C.+Do+not+dereference+null+pointers).
{% cwe-references %}
