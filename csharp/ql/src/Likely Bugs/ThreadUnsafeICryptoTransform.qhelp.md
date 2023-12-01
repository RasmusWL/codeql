{% render "ThreadUnsafeICryptoTransformOverview.inc.qhelp.md" %}


## Recommendation
If the object is shared across instances, you should consider changing the code to use a non-static object of type `System.Security.Cryptography.ICryptoTransform` instead.

As an alternative, you could also look into using `ThreadStatic` attribute, but make sure you read the initialization remarks on the documentation.


## Example
This example demonstrates the dangers of using a static `System.Security.Cryptography.ICryptoTransform` in a way that generates incorrect results.

{% sample src="ThreadUnSafeICryptoTransformBad.cs" %}
A simple fix is to change the `_sha` field from being a static member to an instance one by removing the `static` keyword.

{% sample src="ThreadUnSafeICryptoTransformGood.cs" %}

## References
* Microsoft documentation, [ThreadStaticAttribute Class](https://docs.microsoft.com/en-us/dotnet/api/system.threadstaticattribute?view=netframework-4.7.2).
* Stack Overflow, [Why does SHA1.ComputeHash fail under high load with many threads?](https://stackoverflow.com/questions/26592596/why-does-sha1-computehash-fail-under-high-load-with-many-threads).
{% cwe-references %}
