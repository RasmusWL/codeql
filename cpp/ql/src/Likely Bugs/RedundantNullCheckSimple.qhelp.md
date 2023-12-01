This rule finds comparisons of a pointer to null that occur after a reference of that pointer. It's likely either the check is not required and can be removed, or it should be moved to before the dereference so that a null pointer dereference does not occur.


## Recommendation
The check should be moved to before the dereference, in a way that prevents a null pointer value from being dereferenced. If it's clear that the pointer cannot be null, consider removing the check instead.


## Example
{% sample src="RedundantNullCheckSimple.cpp" %}

## References
* [ Null Dereference ](https://www.owasp.org/index.php/Null_Dereference)
{% cwe-references %}
