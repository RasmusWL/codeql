Arrays might be made `static readonly` to prevent their contents from being changed. This doesn't have the desired effect because arrays are mutable. The `readonly` modifier prevents the array from being replaced by a new array but it does not prevent the contents of the array from being changed.


## Recommendation
Consider whether the array could be split up into separate constants. If the array cannot be split then you may wish to use a `ReadOnlyCollection` instead of an array.


## Example
In this example the `Foo` array is `readonly` but it is still modified by the `Main` method.

{% sample src="StaticArrayBad.cs" %}
This example uses a `ReadOnlyCollection`. Any attempt to modify `Foo` will cause the program not to compile.

{% sample src="StaticArrayGood.cs" %}

## References
* MSDN, C\# Programming Guide, [Arrays as Objects](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/arrays/arrays-as-objects).
* MSDN, [ReadOnlyCollection&lt;T&gt;](http://msdn.microsoft.com/en-us/library/ms132474.aspx).
{% cwe-references %}
