When a local variable is defined with the same name as a built-in type or function, the local variable "shadows" or "hides" the built-in object. This can lead to confusion as a reader of the code may expect the variable to refer to a built-in object.


## Recommendation
Change the name of the local variable so that it no longer matches the name of a built-in object.


## Example
{% sample src="ShadowBuiltin.py" %}

## References
* Python Standard Library: [Built-in Functions](http://docs.python.org/2/library/functions.html), [Built-in Types](http://docs.python.org/2/library/stdtypes.html).
{% cwe-references %}
