MVEL is an expression language based on Java-syntax, which offers many features including invocation of methods available in the JVM. If a MVEL expression is built using attacker-controlled data, and then evaluated, then it may allow attackers to run arbitrary code.


## Recommendation
Including user input in a MVEL expression should be avoided.


## Example
In the following sample, the first example uses untrusted data to build a MVEL expression and then runs it in the default context. In the second example, the untrusted data is validated with a custom method that checks that the expression does not contain unexpected code before evaluating it.

{% sample src="MvelExpressionEvaluation.java" %}

## References
* MVEL Documentation: [Language Guide for 2.0](http://mvel.documentnode.com/).
* OWASP: [Expression Language Injection](https://owasp.org/www-community/vulnerabilities/Expression_Language_Injection).
{% cwe-references %}
