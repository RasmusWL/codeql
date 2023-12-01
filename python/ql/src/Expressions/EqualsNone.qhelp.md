When you compare an object to `None`, use `is` rather than `==`. `None` is a singleton object, comparing using `==` invokes the `__eq__` method on the object in question, which may be slower than identity comparison. Comparing to `None` using the `is` operator is also easier for other programmers to read.


## Recommendation
Replace `==` with `is`.


## Example
The `filter2` function is likely to be more efficient than the `filter1` function because it uses an identity comparison.

{% sample src="EqualsNone.py" %}

## References
* Python Language Reference: [Comparisons](http://docs.python.org/reference/expressions.html#is), [object.__eq__](http://docs.python.org/reference/datamodel.html#object.__eq__).
{% cwe-references %}
