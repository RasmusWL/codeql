Object-Graph Navigation Language (OGNL) is an open-source Expression Language (EL) for Java. OGNL can create or change executable code, consequently it can introduce critical security flaws to any application that uses it. Evaluation of unvalidated expressions is a common flaw in OGNL. This exposes the properties of Java objects to modification by an attacker and may allow them to execute arbitrary code.


## Recommendation
The general recommendation is to avoid evaluating untrusted ONGL expressions. If user-provided OGNL expressions must be evaluated, do this in a sandbox and validate the expressions before evaluation.


## Example
In the following examples, the code accepts an OGNL expression from the user and evaluates it.

In the first example, the user-provided OGNL expression is parsed and evaluated.

The second example validates the expression and evaluates it inside a sandbox. You can add a sandbox by setting a system property, as shown in the example, or by adding `-Dognl.security.manager` to JVM arguments.

{% sample src="OgnlInjection.java" %}

## References
* Apache Commons: [Apache Commons OGNL](https://commons.apache.org/proper/commons-ognl/).
* Struts security: [Proactively protect from OGNL Expression Injections attacks](https://struts.apache.org/security/#proactively-protect-from-ognl-expression-injections-attacks-if-easily-applicable).
{% cwe-references %}
