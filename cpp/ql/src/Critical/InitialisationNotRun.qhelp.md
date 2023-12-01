The query finds code that initializes a global variable (that is, uses it as an L-value) but is never called from `main`. Unless there is another entry point that triggers the initialization, the code should be modified so that the variable is initialized. Uninitialized variables may contain any value, as not all compilers generate code that zero-out memory, especially when optimizations are enabled or the compiler is not compliant with the latest language standards.

{% render "callGraphWarning.inc.qhelp.md" %}


## Recommendation
Examine the code and ensure that the variable is always initialized before it is used.


## Example
In the example below, the code that triggers the initialization of `g_storage` is not run from `main`. Unless the variable is initialized by another method, the call on line 10 may dereference a null pointer.

{% sample src="InitialisationNotRun.cpp" %}

## References
* C++ reference: [uninitialized variables](https://en.cppreference.com/book/uninitialized).
{% cwe-references %}
