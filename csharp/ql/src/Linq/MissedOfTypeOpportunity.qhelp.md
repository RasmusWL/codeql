Programmers often use `as` to iterate over a collection of one type of element that may contain some elements of another - possibly more specific - type. For example, `<B> ` might refer to a collection of objects, some of which refer to an instance of `D` , a class derived from `B`. Programmers often write a loop to iterate over the collection and coerce each `B` in turn to `D` before using it.


## Recommendation
This pattern works well and is also available as the `OfType` method in LINQ. It is better to use a library method in preference to writing your own pattern unless you have a specific need for a custom version. In particular, this makes the code easier to read by expressing the intent better and reducing the number of distinct variables in scope within the loop.


## Example
In this example the programmer is only interested in the items in the array that are `Dog `s.

{% sample src="MissedOfTypeOpportunity.cs" %}
This can be expressed far better by using the `OfType` method.

{% sample src="MissedOfTypeOpportunityFix.cs" %}

## References
* MSDN: [Enumerable.OfType&lt;TResult&gt; Method](http://msdn.microsoft.com/en-us/library/bb360913.aspx).
{% cwe-references %}
