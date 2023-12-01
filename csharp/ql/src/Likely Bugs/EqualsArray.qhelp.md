There are some circumstances where you want to compare two arrays or collections using reference equality, but often you will want a deep comparison instead (that is, one that compares two collections on an element-by-element basis).


## Recommendation
If you intended to make a deep comparison then the solution depends on whether or not you are using C\# 3.5 or later. From C\# 3.5 onward LINQ is available and you can replace the call to ` Equals` with a call to the LINQ extension method `SequenceEqual`. If this is not possible then you can implement a helper function to compare arrays, which can then be used throughout your code.


## Example
This example outputs "False" because calling `Equals` on an array only does a reference comparison.

{% sample src="EqualsArray.cs" %}
The following example outputs "True" twice and uses two different methods of performing a deep comparison of the array.

{% sample src="EqualsArrayFix.cs" %}

## References
* MSDN: [Enumerable.SequenceEqual Method](http://msdn.microsoft.com/en-us/library/system.linq.enumerable.sequenceequal.aspx).
{% cwe-references %}
