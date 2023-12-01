The `super` class should be called with the enclosing class as its first argument and `self` as its second argument.

Passing a different class may work correctly, provided the class passed is a super class of the enclosing class and the enclosing class does not define an `__init__` method. However, this may result in incorrect object initialization if the enclosing class is later subclassed using multiple inheritance.


## Recommendation
Ensure that the first argument to `super()` is the enclosing class.


## Example
In this example the call to `super(Vehicle, self)` in `Car.__init__` is incorrect as it passes `Vehicle` rather than `Car` as the first argument to `super`. As a result, `super(SportsCar, self).__init__()` in the `SportsCar.__init__` method will not call all `__init__()` methods because the call to `super(Vehicle, self).__init__()` skips `StatusSymbol.__init__()`.

{% sample src="CallToSuperWrongClass.py" %}

## References
* Python Standard Library: [super](https://docs.python.org/2/library/functions.html#super).
* Artima Developer: [Things to Know About Python Super](http://www.artima.com/weblogs/viewpost.jsp?thread=236275).
{% cwe-references %}
