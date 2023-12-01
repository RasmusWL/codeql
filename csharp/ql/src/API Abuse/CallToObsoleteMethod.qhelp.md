Methods with the `[Obsolete]` attribute are obsolete and should not be used. Obsolete methods are no longer supported and maintained, may not work correctly, and may be removed in the future.


## Recommendation
Replace the method call with a call to a different method. The `[Obsolete]` attribute should suggest a replacement method to call. If the `[Obsolete]` attribute does not suggest a replacement, then read the class documentation and list of methods to find a suitable replacement.


## Example
The following example shows some code which calls an obsolete method in a `Logger` class. The `Log` method has the attribute `[Obsolete("Use Log(LogLevel level, string s) instead")]` showing that it is obsolete.

{% sample src="CallToObsoleteMethodBad.cs" %}
The code is fixed by calling a different method in the `Logger` class as suggested by the attribute.

{% sample src="CallToObsoleteMethodGood.cs" %}

## References
* MSDN: [ObsoleteAttribute Class](https://msdn.microsoft.com/en-us/library/system.obsoleteattribute(v=vs.110).aspx).
{% cwe-references %}
