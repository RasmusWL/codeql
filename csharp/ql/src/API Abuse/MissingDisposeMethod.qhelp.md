Classes that implement `IDisposable` and have members of `IDisposable` type should also declare/override `Dispose()`.


## Recommendation
Override the `Dispose()` method.


## Example
In the following example, `Bad` extends the `IDisposable` class `BadBase`, but does not override `Dispose()`.

{% sample src="MissingDisposeMethodBad.cs" %}
In the revised example, `Good` overrides `Dispose()`.

{% sample src="MissingDisposeMethodGood.cs" %}

## References
* MSDN: [IDisposable Interface](https://msdn.microsoft.com/en-us/library/system.idisposable.aspx).
{% cwe-references %}
