Template injection occurs when user input is embedded in a template's code in an unsafe manner. An attacker can use native template syntax to inject a malicious payload into a template, which is then executed server-side. This permits the attacker to run arbitrary code in the server's context.


## Recommendation
To fix this, ensure that untrusted input is not used as part of a template's code. If the application requirements do not allow this, use a sandboxed environment where access to unsafe attributes and methods is prohibited.


## Example
In the example given below, an untrusted HTTP parameter `code` is used as a Velocity template string. This can lead to remote code execution.

{% sample src="SSTIBad.java" %}
In the next example, the problem is avoided by using a fixed template string `s`. Since the template's code is not attacker-controlled in this case, this solution prevents the execution of untrusted code.

{% sample src="SSTIGood.java" %}

## References
* Portswigger: [Server Side Template Injection](https://portswigger.net/web-security/server-side-template-injection).
{% cwe-references %}
