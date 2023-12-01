Casting `this` to a type parameter usually suggests that there is an implicit type constraint - the programmer probably wanted to express the notion that `this` could be converted to the type parameter (when using the enclosing method from derived types). However, casting to the desired type, relies on derived types to ensure that the cast will succeed without the compiler forcing them to do so.


## Recommendation
The solution is to enforce the constraint by adding an abstract method on the base type (see example below). Each derived type must then implement this method, which makes the constraint checkable by the compiler and removes the need for a cast.


## Example
In this example `BadBaseNode` relies on derived types to use the right pattern.

{% sample src="CastThisToTypeParameter.java" %}
This constraint is better enforced by adding an abstract method on the base type. Implementing this method makes the constraint checkable by the compiler.

{% sample src="CastThisToTypeParameterFix.java" %}
