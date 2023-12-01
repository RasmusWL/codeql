This rule finds calls to functions that use a global variable before the variable has been initialized. Not all compilers generate code that zero-out memory, especially when optimizations are enabled or the compiler is not compliant with the latest language standards. Accessing uninitialized memory will lead to undefined results.

{% render "dataFlowWarning.inc.qhelp.md" %}


## Recommendation
Initialize the global variable. If no constant can be used for initialization, ensure that all accesses to the variable occur after the initialization code is executed.


## Example
In the example below, `callCtr` is wrongly used before it has been initialized.

{% sample src="GlobalUseBeforeInit.cpp" %}

## References
* SEI CERT C++ Coding Standard: [EXP53-CPP. Do not read uninitialized memory](https://wiki.sei.cmu.edu/confluence/display/cplusplus/EXP53-CPP.+Do+not+read+uninitialized+memory).
{% cwe-references %}
