It is bad practice to use any of the `scanf` functions without including a specified length within the format parameter, as it will be vulnerable to buffer overflows.


## Recommendation
Specify a length within the format string parameter, and make this length one less than the size of the buffer, since the last character should be reserved for the NULL terminator.


## Example
The following example demonstrates safe and unsafe uses of `scanf` type functions.

{% sample src="MemoryUnsafeFunctionScan.cpp" %}

## References
{% cwe-references %}
