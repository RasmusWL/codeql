This rule finds exceptions thrown in destructors. This is dangerous: If the destructor is called during stack unwinding as part of the handling of another exception, throwing an additional exception will immediately terminate the program as per the C++ specification.


## Recommendation
Handle the error condition in a different way.


## Example
{% sample src="ThrowInDestructor.cpp" %}

## References
* M. Cline, [C++ FAQ: How can I handle a destructor that fails?](https://isocpp.org/wiki/faq/exceptions#dtors-shouldnt-throw)
* B. Stroustrup. *The C++ Programming Language Special Edition* p 380. Addison Wesley. 2000.
{% cwe-references %}
