Deserializing a delegate object may result in remote code execution, when an attacker can control the serialized data.


## Recommendation
Avoid deserializing delegate objects, if possible, or make sure that the serialized data cannot be controlled by an attacker.


## Example
In this example, a file stream is deserialized to a `Func<int>` object, using a `BinaryFormatter`. The file stream is a parameter of a public method, so depending on the calls to `InvokeSerialized`, this may or may not pose a security problem.

{% sample src="DeserializedDelegateBad.cs" %}

## References
* Microsoft: [BinaryFormatter Class](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.serialization.formatters.binary.binaryformatter).
{% cwe-references %}
