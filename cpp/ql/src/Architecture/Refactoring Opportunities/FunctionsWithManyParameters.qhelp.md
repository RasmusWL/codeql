This rule finds functions with many parameters. Passing too many parameters to a function is a sign that the function is not cohesive (i.e. lacks a single purpose). These functions could be split into smaller, more cohesive functions.


## Recommendation
These functions could probably be refactored by wrapping related parameters into `struct`s.


## Example
{% sample src="FunctionsWithManyParameters.cpp" %}

## References
* S. McConnell. *Code Complete, 2d ed*. Microsoft Press, 2004.
{% cwe-references %}
