If a variable is dereferenced, for example as the qualifier in a method call, and the variable may have a `null` value on some execution paths leading to the dereferencing, the dereferencing may result in a `NullReferenceException`.


## Recommendation
Ensure that the variable does not have a `null` value when it is dereferenced.


## Example
In the following example, the method `DoPrint()` dereferences its parameter `o` unconditionally, resulting in a `NullReferenceException` via the call `DoPrint(null)`.

{% sample src="NullMaybeBad.cs" %}
In the revised example, the method `DoPrint()` guards the dereferencing with a `null` check.

{% sample src="NullMaybeGood.cs" %}

## References
* Microsoft, [NullReferenceException Class](https://docs.microsoft.com/en-us/dotnet/api/system.nullreferenceexception).
{% cwe-references %}
