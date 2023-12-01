Template Injection occurs when user input is embedded in a template's code in an unsafe manner. An attacker can use native template syntax to inject a malicious payload into a template, which is then executed server-side. This permits the attacker to run arbitrary code in the server's context.


## Recommendation
To fix this, ensure that untrusted input is not used as part of a template's code. If the application requirements do not allow this, use a sandboxed environment where access to unsafe attributes and methods is prohibited.


## Example
Consider the example given below, an untrusted HTTP parameter `name` is used to generate a template string. This can lead to remote code execution.

{% sample src="examples/SSTIBad.rb" %}
Here we have fixed the problem by including ERB/Slim syntax in the string, then the user input will be rendered but not evaluated.

{% sample src="examples/SSTIGood.rb" %}

## References
* Wikipedia: [Server Side Template Injection](https://en.wikipedia.org/wiki/Code_injection#Server_Side_Template_Injection).
* Portswigger : [Server Side Template Injection](https://portswigger.net/web-security/server-side-template-injection).
{% cwe-references %}
