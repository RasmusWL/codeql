The descriptor protocol allows user programmable attribute access. The descriptor protocol is what enables class methods, static methods, properties and `super()`.

Descriptor objects are class attributes which control the behavior of instance attributes. Consequently, a single descriptor is common to all instances of a class and should not be mutated when instance attributes are accessed.


## Recommendation
Do not mutate the descriptor object, rather create a new object that contains the necessary state.


## Example
In this example the descriptor class `MutatingDescriptor` stores a reference to `obj` in an attribute.

{% sample src="MutatingDescriptor.py" %}
In the following example, the descriptor class `NonMutatingDescriptor` returns a new object every time `__get__` is called.

{% sample src="MutatingDescriptorFixed.py" %}

## References
* Python Language Reference: [Implementing Descriptors.](https://docs.python.org/reference/datamodel.html#descriptors)
* Mark Lutz. *Learning Python*, Section 30.6: Methods Are Objects: Bound or Unbound. O'Reilly 2013.
* A real world example: [NumPy Issue 5247.](https://github.com/numpy/numpy/issues/5247)
{% cwe-references %}
