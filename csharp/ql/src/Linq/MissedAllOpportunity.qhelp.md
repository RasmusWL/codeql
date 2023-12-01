Often a programmer wants to check that all the elements of a given sequence satisfy some predicate. A common pattern for this is to create a flag and then iterate over the sequence, changing the flag and breaking out of the loop if the element being examined does not satisfy the predicate.


## Recommendation
This pattern works well and is also available as the `All` method in LINQ. It is better to use a library method in preference to writing your own pattern unless you have a specific need for a custom version. In particular, this makes the code easier to read (the intent is more clearly expressed), shorter, less error-prone and more maintainable.


## Example
In this example the list is iterated in order to check if every element is even.

{% sample src="MissedAllOpportunity.cs" %}
The LINQ `All` method can be used to accomplish this in a much simpler fashion.

{% sample src="MissedAllOpportunityFix.cs" %}

## References
* MSDN: [Enumerable.All&lt;TSource&gt; Method](http://msdn.microsoft.com/en-us/library/bb548541.aspx).
{% cwe-references %}
