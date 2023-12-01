This rule finds comparisons of a function parameter to null that occur when in another path the parameter is dereferenced without a guard check. It's likely either the check is not required and can be removed, or it should be added before the dereference so that a null pointer dereference does not occur.


## Recommendation
A check should be added to before the dereference, in a way that prevents a null pointer value from being dereferenced. If it's clear that the pointer cannot be null, consider removing the check instead.


## Example
{% sample src="RedundantNullCheckParam.cpp" %}

## References
* [ Null Dereference ](https://www.owasp.org/index.php/Null_Dereference)
{% cwe-references %}
