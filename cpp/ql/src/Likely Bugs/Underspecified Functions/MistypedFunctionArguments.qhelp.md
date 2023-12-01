A function is called with at least one argument whose type is incompatible with the type of the corresponding parameter of the function being called. This may cause the called function to behave unpredictably.

This may indicate that an incorrect function is being called, or that the signature (parameter list and parameter types) of the called function is not known to the author.


## Recommendation
Call the function with the proper argument types. In some cases, it may suffice to provide an explicit cast of an argument to the desired (parameter) type.


## Example
{% sample src="MistypedFunctionArguments.c" %}

## References
* SEI CERT C Coding Standard: [ DCL20-C. Explicitly specify void when a function accepts no arguments ](https://wiki.sei.cmu.edu/confluence/display/c/DCL20-C.+Explicitly+specify+void+when+a+function+accepts+no+arguments)
{% cwe-references %}
