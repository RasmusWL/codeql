Sometimes a method of a class can expose an internal field to change by other code if it returns a reference to a mutable private field.


## Recommendation
There are several ways to address this problem depending on your situation. One of the best ways is to use an immutable object to store fields. References to this object can be passed outside the class but the objects are immutable so they cannot be changed.

Another good way of preventing external modification of private fields is to only ever return a copy of the object referred to by the field. This is called "defensive copying". If the copy is changed then internal fields will not be affected.


## Example
This example clearly demonstrates the problem with passing references to mutable objects outside a class. In this case it was possible to modify the values in the array despite the `Range` class not offering any method to do so.

{% sample src="ExposeRepresentationBad.cs" %}

## Fixing with an immutable object
Here the example has been modified to prevent changes to the private field by using a `ReadOnlyCollection` object.

{% sample src="ExposeRepresentationGood1.cs" %}

## Fixing with defensive copying
This is an example of the same class but this time it returns a defensive copy of the private field. There is also a short program showing what happens when an attempt is made to modify the data held by the field.

{% sample src="ExposeRepresentationGood2.cs" %}

## References
* MSDN, C\# Programming Guide, [Arrays as Objects](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/arrays/arrays-as-objects).
* MSDN, [ReadOnlyCollection&lt;T&gt;](http://msdn.microsoft.com/en-us/library/ms132474.aspx).
{% cwe-references %}
