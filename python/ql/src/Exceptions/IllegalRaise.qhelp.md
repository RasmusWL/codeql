If the object raised is not a legal Exception class or an instance of one, then a `TypeError` will be raised instead.

Legal exception classes are:

* Any old-style classes (Python 2 only)
* Any subclass of the builtin class `BaseException`
However, it recommended that you only use subclasses of the builtin class `Exception` (which is itself a subclass of `BaseException`).


## Recommendation
Change the expression in the `raise` statement to be a legal exception.


## Example
{% sample src="IllegalRaise.py" %}

## References
* Python Language Reference: [Exceptions](https://docs.python.org/reference/executionmodel.html#exceptions).
* Python Tutorial: [Handling Exceptions](https://docs.python.org/tutorial/errors.html#handling-exceptions).
{% cwe-references %}
