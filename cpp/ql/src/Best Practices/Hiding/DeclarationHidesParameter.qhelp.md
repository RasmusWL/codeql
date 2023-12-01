This rule finds declarations of local variables that hide parameters of the surrounding function. Such declarations create variables with the same name but different scopes. This makes it hard to understand which variable is actually being used in an expression.


## Recommendation
Consider changing the name of either the variable or the parameter to keep them distinct.


## Example
{% sample src="DeclarationHidesParameter.cpp" %}

## References
* B. Stroustrup. *The C++ Programming Language Special Edition* p 82. Addison Wesley. 2000.
{% cwe-references %}
