Special methods (sometimes also called magic methods) are how user defined classes interact with the Python virtual machine. For example, for a class to support addition it must implement the `__add__` and `__radd__` special methods. When the expression `a + b` is evaluated the Python virtual machine will call `type(a).__add__(a, b)` and if that is not implemented it will call `type(b).__radd__(b, a)`.

Since these special methods are always called by the virtual machine with a fixed number of parameters, if the method is implemented with a different number of parameters it will fail at runtime with a `TypeError`.


## Recommendation
Ensure that the method has the correct number of parameters


## Example
In the example the `__str__` method has an extra parameter. This means that if `str(p)` is called when `p` is a `Point` then it will fail with a `TypeError`.

{% sample src="SignatureSpecialMethods.py" %}

## References
* Python Language Reference: [Special Method Names](http://docs.python.org/dev/reference/datamodel.html#special-method-names).
{% cwe-references %}
