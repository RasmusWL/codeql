Deserializing an object from untrusted input may result in security problems, such as denial of service or remote code execution.


## Recommendation
Avoid using an unsafe deserialization framework.


## Example
In this example, a string is deserialized using a `JavaScriptSerializer` with a simple type resolver. Using a type resolver means that arbitrary code may be executed.

{% sample src="UnsafeDeserializationBad.cs" %}
To fix this specific vulnerability, we avoid using a type resolver. In other cases, it may be necessary to use a different deserialization framework.

{% sample src="UnsafeDeserializationGood.cs" %}

## References
* Mu&ntilde;oz, Alvaro and Mirosh, Oleksandr: [JSON Attacks](https://www.blackhat.com/docs/us-17/thursday/us-17-Munoz-Friday-The-13th-Json-Attacks.pdf).
{% cwe-references %}
