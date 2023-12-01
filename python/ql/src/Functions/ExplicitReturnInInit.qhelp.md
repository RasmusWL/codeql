The `__init__` method of a class is used to initialize new objects, not create them. As such, it should not return any value. Returning `None` is correct in the sense that no runtime error will occur, but it suggests that the returned value is meaningful, which it is not.


## Recommendation
Convert the `return expr` statement to a plain `return` statement, or omit it altogether if it is at the end of the method.


## Example
In this example, the `__init__` method attempts to return the newly created object. This is an error and the return method should be removed.

{% sample src="ExplicitReturnInInit.py" %}

## References
* Python: [The __init__ method](http://docs.python.org/2.7/reference/datamodel.html#object.__init__).
{% cwe-references %}
