If a variable is dereferenced, for example as the qualifier in a method call, and the variable has a `null` value on all possible execution paths leading to the dereferencing, the dereferencing is guaranteed to result in a `NullReferenceException`.


## Recommendation
Ensure that the variable does not have a `null` value when it is dereferenced.


## Example
In the following examples, the condition `s.Length > 0` is only executed if `s` is `null`.

{% sample src="NullAlwaysBad.cs" %}
In the revised example, the condition is guarded correctly by using `&&` instead of `||`.

{% sample src="NullAlwaysGood.cs" %}

## References
* Microsoft, [NullReferenceException Class](https://docs.microsoft.com/en-us/dotnet/api/system.nullreferenceexception).
{% cwe-references %}
