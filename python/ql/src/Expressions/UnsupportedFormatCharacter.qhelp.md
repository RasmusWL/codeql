A format string, that is the string on the left hand side of an expression like `fmt % arguments`, must consist of legal conversion specifiers. Otherwise, a `ValueError` will be raised.


## Recommendation
Choose a legal conversion specifier.


## Example
In `format_as_tuple_incorrect`, "t" is not a legal conversion specifier.

{% sample src="UnsupportedFormatCharacter.py" %}

## References
* Python Library Reference: [String Formatting.](http://docs.python.org/library/stdtypes.html#string-formatting)
{% cwe-references %}
