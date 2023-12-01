Code immediately following a `goto` or `break` statement will not be executed, unless there is a label or switch case. When the code is necessary, this leads to logical errors or resource leaks. If the code is unnecessary, it may confuse readers.


## Recommendation
If the unreachable code is necessary, move the `goto` or `break` statement to after the code. Otherwise, delete the unreachable code.


## Example
{% sample src="DeadCodeGoto.cpp" %}

## References
* The CERT C Secure Coding Standard: [MSC12-C. Detect and remove code that has no effect or is never executed](https://wiki.sei.cmu.edu/confluence/display/c/MSC12-C.+Detect+and+remove+code+that+has+no+effect+or+is+never+executed).
{% cwe-references %}
