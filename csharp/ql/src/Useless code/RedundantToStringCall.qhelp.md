In certain contexts, such as when concatenating a string and an object, calling `ToString` explicitly can be omitted.


## Recommendation
Remove the redundant call to `ToString`.


## Example
In the following example, `ToString` is called explicitly on `o`, before being passed to `string.Format`.

{% sample src="RedundantToStringCallBad.cs" %}
In the revised example, the call to `ToString` is omitted, as `string.Format` will invoke `ToString` implicitly.

{% sample src="RedundantToStringCallGood.cs" %}

## References
* MSDN: [+ Operator](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/operators/addition-operator), [String.Format method](https://msdn.microsoft.com/en-us/library/system.string.format(v=vs.110).aspx).
{% cwe-references %}
