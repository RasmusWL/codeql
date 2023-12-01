A variable is in scope in its own initializer, but it is undefined behavior to load from it before it is first assigned to.


## Recommendation
Do not use a variable in its own initializer unless it is part of an address calculation or a `sizeof` expression.


## Example
{% sample src="UseInOwnInitializer.cpp" %}

## References
* [ SEI CERT Secure Coding Standard: EXP53-CPP. Do not read uninitialized memory ](https://wiki.sei.cmu.edu/confluence/display/cplusplus/EXP53-CPP.+Do+not+read+uninitialized+memory)
{% cwe-references %}
