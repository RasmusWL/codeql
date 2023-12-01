A formatting expression, that is an expression of the form `the_format.format(args)` or `format(the_format, args)`, can use explicitly numbered fields, like `{1}`, or implicitly numbered fields, such as `{}`, but it cannot use both. Doing so will raise a `ValueError`.


## Recommendation
Use either explicitly numbered fields or implicitly numbered fields, but be consistent.


## Example
In the following example the formatting uses both implicit, `{}`, and explicit, `{1}`, numbering for fields, which is illegal.

{% sample src="MixedExplicitImplicitIn3101Format.py" %}

## References
* Python Library Reference: [String Formatting.](https://docs.python.org/2/library/string.html#string-formatting)
{% cwe-references %}
