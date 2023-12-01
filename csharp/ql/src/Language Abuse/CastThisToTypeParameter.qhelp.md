Casting `this` to a type parameter may indicate an implicit type constraint. That is, the programmer wanted to express that `this` can be converted to the type parameter but could not find an appropriate way to do so. Instead, they rely on derived type to implement the correct interface.


## Recommendation
The solution is to enforce the constraint using the mechanism of an abstract property on the base type. Each derived type must then implement this property, which makes the constraint checkable by the compiler and removes the need for a cast.


## Example
In this example the programmer is relying on any concrete implementations of `BaseNode ` to follow the correct design pattern. `Derived1` does but `Derived2` does not. The program will still compile but will crash if an attempt is made to access the ` Root` property of an instance of `Derived2`.

{% sample src="CastThisToTypeParameter.cs" %}
It would be better to enforce this using an abstract property.

{% sample src="CastThisToTypeParameterFix.cs" %}
