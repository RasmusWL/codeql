It is common to want to check an object against `null`, but this should not be done using the `Equals` method. If the object really is `null`, a ` NullReferenceException` is thrown when attempting to call `Equals`, with unexpected results.


## Recommendation
The offending call should be replaced with either `==` or `ReferenceEquals` (the difference being that `==` can be overridden but `ReferenceEquals` cannot).


## Example
In the following example, `IsNull` will throw a `NullReferenceException` when `o` is `null`.

{% sample src="NullArgumentToEqualsBad.cs" %}
In the revised example, `IsNull` will correctly return `true` when `o` is `null`.

{% sample src="NullArgumentToEqualsGood.cs" %}

## References
* MSDN: [Object.Equals Method (Object)](https://msdn.microsoft.com/en-us/library/bsc2ak47.aspx).
{% cwe-references %}
