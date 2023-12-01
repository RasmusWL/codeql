This query finds variables that are used before they are initialized. Values of uninitialized variables are undefined, as not all compilers zero out memory, especially when optimizations are enabled or the compiler is not compliant with the latest language standards.


## Recommendation
Initialize the variable before accessing it.


## Example
{% sample src="NotInitialised.cpp" %}

## References
* C++ reference: [uninitialized variables](https://en.cppreference.com/book/uninitialized).
{% cwe-references %}
