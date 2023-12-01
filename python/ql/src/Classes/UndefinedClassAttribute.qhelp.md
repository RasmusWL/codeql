A non-existent attribute of `self` is accessed in a method. An attribute is treated as non-existent if it is not a class attribute and it is not set in any method of the class. This may result in an `AttributeError` at run time.


## Recommendation
Ensure that all attributes are initialized in the `__init__` method.


## Example
{% sample src="UndefinedClassAttribute.py" %}

## References
* Python Standard Library: [exception AttributeError](http://docs.python.org/library/exceptions.html#exceptions.AttributeError).
{% cwe-references %}
