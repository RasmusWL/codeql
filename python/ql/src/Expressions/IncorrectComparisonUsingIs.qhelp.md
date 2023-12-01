When you compare two values using the `is` or `is not` operator, it is the object identities of the two values that is tested rather than their equality. If the class of either of the values in the comparison redefines equality then the `is` operator may return `False` even though the objects compare as equal. Equality is defined by the `__eq__` or, in Python2, `__cmp__` method. To compare two objects for equality, use the `==` or `!=` operator instead.


## Recommendation
When you want to compare the value of two literals, use the comparison operator `==` or `!=` in place of `is` or `is not`.

If the uniqueness property or performance are important then use an object that does not redefine equality.


## Example
In the first line of the following example the programmer tests the value of `value` against `DEFAULT` using the `is` operator. Unfortunately, this may fail when the function is called with the string `"default"`.

To function correctly, change the expression `value is DEFAULT` to `value == DEFAULT`. Alternatively, if the uniqueness property is desirable, then change the definition of `DEFAULT` to either of the alternatives below.

{% sample src="IncorrectComparisonUsingIs.py" %}

## References
* Python Standard Library: [Comparisons](http://docs.python.org/2/library/stdtypes.html#comparisons).
{% cwe-references %}
