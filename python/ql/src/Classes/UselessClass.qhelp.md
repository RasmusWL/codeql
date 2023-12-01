If a class has only one public method (other than its `__init__`) it should be replaced with a function.


## Recommendation
Convert the single public method into a function. If there is an `__init__` and it sets attributes on the `self` then rename the `__init__` method and remove the `self` parameter Make the public method an inner function and return that.

Delete the class.


## Example
In this example the class only has a single method. This method does not need to be in its own class. It should be a method on its own that takes `a` and `b` as parameters.

{% sample src="UselessClass.py" %}

## References
* Python: [Classes](http://docs.python.org/tutorial/classes.html).
{% cwe-references %}
