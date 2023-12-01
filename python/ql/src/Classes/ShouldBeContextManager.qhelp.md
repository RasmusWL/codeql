If a class has a `close()` or similar method to release resources, then it should be made a context manager. Using a context manager allows instances of the class to be used in the `with` statement, improving code size and readability. This is a simpler and more reliable method than implementing just a `__del__` method.


## Recommendation
The context manager requires an `__enter__` and an `__exit__` method:

* `__enter__` method acquires the resource or does nothing if the resource is acquired in the `__init__` method
* `__exit__` method releases the resource, this can just be a simple wrapper around the `close` method.

## Example
The following example shows how a class definition that implements `__del__` can be updated to use a context manager.

{% sample src="ShouldBeContextManager.py" %}

## References
* Effbot: [Python with statement](https://web.archive.org/web/20201012110738/http://effbot.org/zone/python-with-statement.htm).
* Python Standard Library: [Context manager ](http://docs.python.org/library/stdtypes.html#context-manager-types).
* Python Language Reference: [ With Statement Context Managers](http://docs.python.org/2.7/reference/datamodel.html#with-statement-context-managers).
* Python PEP 343: [The "with" Statement](http://www.python.org/dev/peps/pep-0343).
{% cwe-references %}
