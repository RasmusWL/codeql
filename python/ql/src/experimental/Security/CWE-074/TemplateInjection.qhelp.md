Template Injection occurs when user input is embedded in a template in an unsafe manner. When an attacker is able to use native template syntax to inject a malicious payload into a template, which is then executed server-side is results in Server Side Template Injection.


## Recommendation
To fix this, ensure that an untrusted value is not used as a template. If the application requirements do not alow this, use a sandboxed environment where access to unsafe attributes and methods is prohibited.


## Example
Consider the example given below, an untrusted HTTP parameter \`template\` is used to generate a Jinja2 template string. This can lead to remote code execution.

{% sample src="JinjaBad.py" %}
Here we have fixed the problem by using the Jinja sandbox environment for evaluating untrusted code.

{% sample src="JinjaGood.py" %}

## References
* Portswigger : \[Server Side Template Injection\](https://portswigger.net/web-security/server-side-template-injection)
{% cwe-references %}
