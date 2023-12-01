Classes that implement `IDisposable` and have members of `IDisposable` type should dispose those members in their `Dispose()` method.


## Recommendation
Add a call to `m.Dispose()` in your `Dispose` method for each member `m` that implements `IDisposable`.


## Example
In this example, the class `Bad` contains two disposable fields `stream1` and `stream2`, but only `stream1` is disposed in `Bad`'s `Dispose()` method.

{% sample src="MissingDisposeCallBad.cs" %}
In the revised example, both `stream1` and `stream2` are disposed.

{% sample src="MissingDisposeCallGood.cs" %}

## References
* MSDN: [IDisposable Interface](https://msdn.microsoft.com/en-us/library/system.idisposable.aspx).
{% cwe-references %}
