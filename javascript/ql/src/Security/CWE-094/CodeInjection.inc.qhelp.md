Directly evaluating user input (for example, an HTTP request parameter) as code without properly sanitizing the input first allows an attacker arbitrary code execution. This can occur when user input is treated as JavaScript, or passed to a framework which interprets it as an expression to be evaluated. Examples include AngularJS expressions or JQuery selectors.


## Recommendation
Avoid including user input in any expression which may be dynamically evaluated. If user input must be included, use context-specific escaping before including it. It is important that the correct escaping is used for the type of evaluation that will occur.


## Example
The following example shows part of the page URL being evaluated as JavaScript code. This allows an attacker to provide JavaScript within the URL. If an attacker can persuade a user to click on a link to such a URL, the attacker can evaluate arbitrary JavaScript in the browser of the user to, for example, steal cookies containing session information.

{% sample src="examples/CodeInjection.js" %}
The following example shows a Pug template being constructed from user input, allowing attackers to run arbitrary code via a payload such as `#{global.process.exit(1)}`.

{% sample src="examples/ServerSideTemplateInjection.js" %}
Below is an example of how to use a template engine without any risk of template injection. The user input is included via an interpolation expression `#{username}` whose value is provided as an option to the template, instead of being part of the template string itself:

{% sample src="examples/ServerSideTemplateInjectionSafe.js" %}

## References
* OWASP: [Code Injection](https://www.owasp.org/index.php/Code_Injection).
* Wikipedia: [Code Injection](https://en.wikipedia.org/wiki/Code_injection).
* PortSwigger Research Blog: [Server-Side Template Injection](https://portswigger.net/research/server-side-template-injection).
{% cwe-references %}
