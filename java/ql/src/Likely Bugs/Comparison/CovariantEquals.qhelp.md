Classes that define an `equals` method whose parameter type is not `Object` *overload* the `Object.equals` method instead of *overriding* it. This may not be intended.


## Recommendation
To *override* the `Object.equals` method, the parameter of the `equals` method must have type `Object`.


## Example
In the following example, the definition of class `BadPoint` does not override the `Object.equals` method. This means that `p.equals(q)` resolves to the default definition of `Object.equals` and returns `false`. Class `GoodPoint` correctly overrides `Object.equals`, so that `r.equals(s)` returns `true`.

{% sample src="CovariantEquals.java" %}

## References
* J. Bloch, *Effective Java (second edition)*, Item 8. Addison-Wesley, 2008.
* Java Language Specification: [Overriding (by Instance Methods)](https://docs.oracle.com/javase/specs/jls/se11/html/jls-8.html#jls-8.4.8.1), [Overloading](https://docs.oracle.com/javase/specs/jls/se11/html/jls-8.html#jls-8.4.9).
* The Java Tutorials: [Overriding and Hiding Methods](https://docs.oracle.com/javase/tutorial/java/IandI/override.html).
{% cwe-references %}
