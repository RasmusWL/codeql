This rule finds functions that are declared in a block. It is confusing to declare a function at block scope, and the visibility of the function is not what would be expected. `extern` function declarations inside a block, which are allowed in C, are particularly confusing, as the scope of the declaration is the entire file, not just the block where it was declared.


## Recommendation
Declare the function in file scope to prevent any confusion as to its visibility.


## Example
{% sample src="AV Rule 107.cpp" %}

## References
* AV Rule 107, *Joint Strike Fighter Air Vehicle C++ Coding Standards*. Lockheed Martin Corporation, 2005.
* MISRA C++ Rule 3-1-2, *Guidelines for the use of the C++ language in critical systems*. The Motor Industry Software Reliability Associate, 2008.
{% cwe-references %}
