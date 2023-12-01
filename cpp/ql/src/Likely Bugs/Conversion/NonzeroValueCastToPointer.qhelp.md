This rule finds compile-time constants other than zero (and some common error markers, like `-1` and `0xdeadbeef`) which are (explicitly or implicitly) converted to a pointer type. This is a dangerous practice, since the meaning of the numerical value of pointers is platform dependent.


## Recommendation
Do not assign integer literals (except NULL) to pointers.


## Example
{% sample src="NonzeroValueCastToPointer.cpp" %}

## References
* Cplusplus.com: [Pointers](http://www.cplusplus.com/doc/tutorial/pointers/).
* The CERT C Secure Coding Standard: [INT36-C. Converting a pointer to integer or integer to pointer](https://www.securecoding.cert.org/confluence/display/c/INT36-C.+Converting+a+pointer+to+integer+or+integer+to+pointer).
{% cwe-references %}
