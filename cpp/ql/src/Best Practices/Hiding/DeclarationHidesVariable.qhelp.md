This rule finds declarations of local variables that hide a local variable from a surrounding scope. Such declarations create variables with the same name but different scopes. This makes it difficult to know which variable is actually used in an expression.


## Recommendation
Consider changing the name of either variable to keep them distinct.


## Example
{% sample src="DeclarationHidesVariable.cpp" %}

## References
* B. Stroustrup. *The C++ Programming Language Special Edition* p 82. Addison Wesley. 2000.
{% cwe-references %}
