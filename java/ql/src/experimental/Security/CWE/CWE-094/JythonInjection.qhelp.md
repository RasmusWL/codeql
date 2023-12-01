Python has been the most widely used programming language in recent years, and Jython (formerly known as JPython) is a popular Java implementation of Python. It allows embedded Python scripting inside Java applications and provides an interactive interpreter that can be used to interact with Java packages or with running Java applications. If an expression is built using attacker-controlled data and then evaluated, it may allow the attacker to run arbitrary code.


## Recommendation
In general, including user input in Jython expression should be avoided. If user input must be included in an expression, it should be then evaluated in a safe context that doesn't allow arbitrary code invocation.


## Example
The following code could execute arbitrary code in Jython Interpreter

{% sample src="JythonInjection.java" %}

## References
* Jython Organization: [Jython and Java Integration](https://jython.readthedocs.io/en/latest/JythonAndJavaIntegration/)
* PortSwigger: [Python code injection](https://portswigger.net/kb/issues/00100f10_python-code-injection)
{% cwe-references %}
