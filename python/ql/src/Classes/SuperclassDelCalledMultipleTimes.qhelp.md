Python, unlike statically typed languages such as Java, allows complete freedom when calling methods during object destruction. However, standard object-oriented principles apply to Python classes using deep inheritance hierarchies. Therefore the developer has responsibility for ensuring that objects are properly cleaned up when there are multiple `__del__` methods that need to be called.

Calling a `__del__` method more than once during object destruction risks resources being released multiple times. The relevant `__del__` method may not be designed to be called more than once.

There are a number of ways that a `__del__` method may be be called more than once.

* There may be more than one explicit call to the method in the hierarchy of `__del__` methods.
* A class using multiple inheritance directly calls the `__del__` methods of its base types. One or more of those base types uses `super()` to pass down the inheritance chain.

## Recommendation
Either be careful not to explicitly call a `__del__` method more than once, or use `super()` throughout the inheritance hierarchy.

Alternatively refactor one or more of the classes to use composition rather than inheritance.


## Example
In the first example, explicit calls to `__del__` are used, but `SportsCar` erroneously calls both `Vehicle.__del__` and `Car.__del__`. This can be fixed by removing the call to `Vehicle.__del__`, as shown in `FixedSportsCar`.

{% sample src="SuperclassDelCalledMultipleTimes.py" %}
In the second example, there is a mixture of explicit calls to `__del__` and calls using `super()`. To fix this example, `super()` should be used throughout.

{% sample src="SuperclassInitCalledMultipleTimes2.py" %}

## References
* Python Tutorial: [Classes](https://docs.python.org/2/tutorial/classes.html).
* Python Standard Library: [super](https://docs.python.org/2/library/functions.html#super).
* Artima Developer: [Things to Know About Python Super](http://www.artima.com/weblogs/viewpost.jsp?thread=236275).
* Wikipedia: [Composition over inheritance](http://en.wikipedia.org/wiki/Composition_over_inheritance).
{% cwe-references %}
