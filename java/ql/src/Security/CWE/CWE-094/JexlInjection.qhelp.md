Java EXpression Language (JEXL) is a simple expression language provided by the Apache Commons JEXL library. The syntax is close to a mix of ECMAScript and shell-script. The language allows invocation of methods available in the JVM. If a JEXL expression is built using attacker-controlled data, and then evaluated, then it may allow the attacker to run arbitrary code.


## Recommendation
It is generally recommended to avoid using untrusted input in a JEXL expression. If it is not possible, JEXL expressions should be run in a sandbox that allows accessing only explicitly allowed classes.


## Example
The following example uses untrusted data to build and run a JEXL expression.

{% sample src="UnsafeJexlExpressionEvaluation.java" %}
The next example shows how an untrusted JEXL expression can be run in a sandbox that allows accessing only methods in the `java.lang.Math` class. The sandbox is implemented using `JexlSandbox` class that is provided by Apache Commons JEXL 3.

{% sample src="SaferJexlExpressionEvaluationWithSandbox.java" %}
The next example shows another way how a sandbox can be implemented. It uses a custom implementation of `JexlUberspect` that checks if callees are instances of allowed classes.

{% sample src="SaferJexlExpressionEvaluationWithUberspectSandbox.java" %}

## References
* Apache Commons JEXL: [Project page](https://commons.apache.org/proper/commons-jexl/).
* Apache Commons JEXL documentation: [JEXL 2.1.1 API](https://commons.apache.org/proper/commons-jexl/javadocs/apidocs-2.1.1/).
* Apache Commons JEXL documentation: [JEXL 3.1 API](https://commons.apache.org/proper/commons-jexl/apidocs/index.html).
* OWASP: [Expression Language Injection](https://owasp.org/www-community/vulnerabilities/Expression_Language_Injection).
{% cwe-references %}
