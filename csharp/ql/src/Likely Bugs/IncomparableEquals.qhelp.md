Calling `x.Equals(y)` on incomparable types will almost always return false. If two classes do not have a common parent class their instances are considered incomparable.


## Recommendation
Carefully check the code for errors.


## Example
In this example both calls to the Equals method will always return false regardless of the contents of the `ArrayList` or `String` because `ArrayList`s and `String`s are incomparable.

{% sample src="IncomparableEquals.cs" %}

## References
* MSDN, [Object.Equals Method](http://msdn.microsoft.com/en-us/library/bsc2ak47.aspx).
{% cwe-references %}
