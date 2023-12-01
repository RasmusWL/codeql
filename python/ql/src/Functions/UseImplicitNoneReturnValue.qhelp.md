All functions in Python return a value. If a function has no `return` statements or none of the `return` statements return a value then the function will return `None`. However, this value has no meaning and should be ignored.

Using the return value of such a 'procedure' is confusing to the reader as it suggests that the value is significant.


## Recommendation
Do not use the return value of a procedure; replace `x = proc()` with `proc()` and replace any use of the value with `None`.


## Example
In this example, the `my_print` function is a procedure as it returns no value of any meaning. Using the return value is misleading in subsequent code.

{% sample src="UseImplicitNoneReturnValue.py" %}

## References
* Python Library Reference: [None](http://docs.python.org/library/constants.html#None).
{% cwe-references %}
