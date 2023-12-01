A formatting expression, that is an expression of the format `fmt % arguments` must have the correct number of arguments on the right hand side of the expression. Otherwise, a `TypeError` will be raised.


## Recommendation
Change the format to match the arguments and ensure that the right hand argument always has the correct number of elements.


## Example
In the following example the right hand side of the formatting operation can be of length 2, which does not match the format string.

{% sample src="WrongNumberArgumentsForFormat.py" %}

## References
* Python Library Reference: [String Formatting.](http://docs.python.org/library/stdtypes.html#string-formatting)
{% cwe-references %}
