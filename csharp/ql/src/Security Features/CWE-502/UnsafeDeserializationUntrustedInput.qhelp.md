Deserializing an object from untrusted input may result in security problems, such as denial of service or remote code execution.


## Recommendation
Avoid deserializing objects from an untrusted source, and if not possible, make sure to use a safe deserialization framework.


## Example
In this example, text from an HTML text box is deserialized using a `JavaScriptSerializer` with a simple type resolver. Using a type resolver means that arbitrary code may be executed.

{% sample src="UnsafeDeserializationUntrustedInputBad.cs" %}
To fix this specific vulnerability, we avoid using a type resolver. In other cases, it may be necessary to use a different deserialization framework.

{% sample src="UnsafeDeserializationUntrustedInputGood.cs" %}
In the following example potentially untrusted stream and type is deserialized using a `DataContractJsonSerializer` which is known to be vulnerable with user supplied types.

{% sample src="UnsafeDeserializationUntrustedInputTypeBad.cs" %}
To fix this specific vulnerability, we are using hardcoded Plain Old CLR Object ([POCO](https://en.wikipedia.org/wiki/Plain_old_CLR_object)) type. In other cases, it may be necessary to use a different deserialization framework.

{% sample src="UnsafeDeserializationUntrustedInputTypeGood.cs" %}

## References
* Mu&ntilde;oz, Alvaro and Mirosh, Oleksandr: [JSON Attacks](https://www.blackhat.com/docs/us-17/thursday/us-17-Munoz-Friday-The-13th-Json-Attacks.pdf).
{% cwe-references %}
