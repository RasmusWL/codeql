When two identical expressions are compared it is typically an indication of a mistake, since the Boolean value of the comparison will always be the same. Often, it can indicate that `self` has been omitted.


## Recommendation
It is never good practice to compare a value with itself. If `self` has been omitted, then insert it. If the constant behavior is indeed required, use the Boolean literals `True` or `False`, rather than encoding them obscurely as `x == x` or similar.


## Example
{% sample src="CompareIdenticalValuesMissingSelf.py" %}

## References
* Python Language Reference: [Comparisons](http://docs.python.org/2/reference/expressions.html#not-in).
{% cwe-references %}
