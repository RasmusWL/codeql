A possibly non-existent attribute of `self` is accessed in a method. The attribute is set in another method of the class, but may be uninitialized if the method that uses the attribute is called before the one that sets it. This may result in an `AttributeError` at run time.


## Recommendation
Ensure that all attributes are initialized in the `__init__` method.


## Example
{% sample src="MaybeUndefinedClassAttribute.py" %}

## References
* Python Standard Library: [exception AttributeError](http://docs.python.org/library/exceptions.html#exceptions.AttributeError).
{% cwe-references %}
