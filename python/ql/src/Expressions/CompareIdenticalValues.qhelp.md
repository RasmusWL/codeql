When two identical expressions are compared it is typically an indication of a mistake, since the Boolean value of the comparison will always be the same, unless the value is the floating point value `float('nan')`.


## Recommendation
It is not good practice to compare a value with itself, as it makes the code hard to read and can hide errors with classes that do not correctly implement equality. If testing whether a floating-point value is not-a-number, then use `math.isnan()`. If the value may be a complex number, then use `cmath.isnan()` instead.


## Example
In this example `f == f` is used to check for `float('nan')`. This makes the code difficult to understand as the reader may not be immediately familiar with this pattern.

{% sample src="CompareIdenticalValues.py" %}

## References
* Python Language Reference: [Comparisons](http://docs.python.org/2/reference/expressions.html#not-in).
* Python Library Reference: [math.isnan()](https://docs.python.org/2/library/math.html#math.isnan).
* Python Library Reference: [cmath.isnan()](https://docs.python.org/2/library/cmath.html#cmath.isnan).
{% cwe-references %}
