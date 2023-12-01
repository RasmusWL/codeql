A class that defines attributes that are not present in its superclasses may need to override the `__eq__()` method (`__ne__()` should also be defined).

Adding additional attributes without overriding `__eq__()` means that the additional attributes will not be accounted for in equality tests.


## Recommendation
Override the `__eq__` method.


## Example
In the following example the `ColorPoint` class subclasses the `Point` class and adds a new attribute, but does not override the `__eq__` method.

{% sample src="DefineEqualsWhenAddingAttributes.py" %}

## References
* Peter Grogono, Philip Santas: [Equality in Object Oriented Languages](http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.48.5109&rep=rep1&type=pdf)
{% cwe-references %}
