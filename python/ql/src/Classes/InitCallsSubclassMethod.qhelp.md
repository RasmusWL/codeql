When an instance of a class is initialized, the super-class state should be fully initialized before it becomes visible to the subclass. Calling methods of the subclass in the superclass' `__init__` method violates this important invariant.


## Recommendation
Do not use methods that are subclassed in the construction of an object. For simpler cases move the initialization into the superclass' `__init__` method, preventing it being overridden. Additional initialization of subclass should be done in the `__init__` method of the subclass. For more complex cases, it is advisable to use a static method or function to manage object creation.

Alternatively, avoid inheritance altogether using composition instead.


## Example
{% sample src="InitCallsSubclassMethod.py" %}

## References
* CERT Secure Coding: [ Rule MET05-J](https://www.securecoding.cert.org/confluence/display/java/MET05-J.+Ensure+that+constructors+do+not+call+overridable+methods). Although this is a Java rule it applies to most object-oriented languages.
* Python Standard Library: [Static methods](http://docs.python.org/library/functions.html#staticmethod).
* Wikipedia: [Composition over inheritance](http://en.wikipedia.org/wiki/Composition_over_inheritance).
{% cwe-references %}
