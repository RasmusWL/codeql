When the class of the object on which `Equals(object)` is called does not define its own `Equals(object)` method, an `Equals(object)` method defined in one of its base classes will be called instead. In the worst case, the `Equals(object)` method of `System.Object` will be called, resulting in a reference equality check. This is probably not what was intended.

Classes that implement the `==` operator should also override the `Equals(object)` method, because otherwise the two forms of equality will behave differently, leading to unexpected behavior.


## Recommendation
Implement an `Equals(object)` method for the highlighted class. Examine subclasses of the class highlighted to determine if they should implement their own equals method too.


## Example
The output of this example states that "car1 does equal car2" despite the fact that one is a leaded version and one is an unleaded version. This is because the `GasolineCar` class is inheriting `Equals(object)` from `Car` and that method states that two `Car`s are equal if their make and model are the same.

{% sample src="ClassDoesNotImplementEqualsBad.cs" %}
In the revised example, `GasolineCar` overrides `Equals(object)`, and the output is "car1 does not equal car2", as expected.

{% sample src="ClassDoesNotImplementEqualsGood.cs" %}

## References
* Microsoft: [Equality Operators](https://docs.microsoft.com/en-us/dotnet/standard/design-guidelines/equality-operators), [Equality Comparisons (C\# Programming Guide)](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/statements-expressions-operators/equality-comparisons).
{% cwe-references %}
