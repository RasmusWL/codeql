This rule finds local variables that are never accessed after declaration. Unused variables should be removed to increase readability and avoid misuse.


## Recommendation
Removing these unused local variables will make code more readable.


## Example
{% sample src="UnusedLocals.cpp" %}

## References
* [Variable scope](http://www.tutorialspoint.com/cplusplus/cpp_variable_scope.htm)
* [MSC12-C. Detect and remove code that has no effect](https://wiki.sei.cmu.edu/confluence/display/c/MSC12-C.+Detect+and+remove+code+that+has+no+effect+or+is+never+executed)
{% cwe-references %}
