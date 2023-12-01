{% render "ThreadUnsafeICryptoTransformOverview.inc.qhelp.md" %}


## Recommendation
Create new instances of the object that implements or has a field of type `System.Security.Cryptography.ICryptoTransform` to avoid sharing it across multiple threads.


## Example
This example demonstrates the dangers of using a shared `System.Security.Cryptography.ICryptoTransform` in a way that generates incorrect results or may raise an exception.

{% sample src="ThreadUnSafeICryptoTransformLambdaBad.cs" %}
A simple fix is to change the local variable `sha1` being captured by the lambda to be a local variable within the lambda.

{% sample src="ThreadUnSafeICryptoTransformLambdaGood.cs" %}

## References
* Microsoft documentation, [ThreadStaticAttribute Class](https://docs.microsoft.com/en-us/dotnet/api/system.threadstaticattribute?view=netframework-4.7.2).
* Stack Overflow, [Why does SHA1.ComputeHash fail under high load with many threads?](https://stackoverflow.com/questions/26592596/why-does-sha1-computehash-fail-under-high-load-with-many-threads).
{% cwe-references %}
