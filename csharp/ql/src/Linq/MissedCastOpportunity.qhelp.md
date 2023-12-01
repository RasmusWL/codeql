Casts are often used when you iterate over a collection of elements of a type that is known to contain only elements of a different type (possibly more specific). For example, `List<Animal > ` might refer to a collection of instances of `Dog`, a class derived from `Animal`. Programmers often write a loop to iterate over the collection and cast each `Animal` in turn to `Dog` before using it


## Recommendation
This pattern works well and is also available as the `Cast` method in LINQ. It is better to use a library method in preference to writing your own pattern unless you have a specific need for a custom version. In particular, this makes the code easier to read by expressing the intent better and reducing the number of distinct variables in scope within the loop. It is important to remember that Cast will throw a InvalidCastException if any of the elements cannot be cast. (If you are not sure that all of the elements have the expected type, and you only want to operate on the ones that do, then consider using `OfType` instead.)


## Example
In this example, each element in the array of `Animal`'s is cast to `Dog`.

{% sample src="MissedCastOpportunity.cs" %}
This could be written better using LINQ's cast method to cast the whole list and then iterate over that.

{% sample src="MissedCastOpportunityFix.cs" %}

## References
* MSDN: [Enumerable.Cast&lt;TResult&gt; Method](http://msdn.microsoft.com/en-us/library/bb341406.aspx).
{% cwe-references %}
