BeanShell is a small, free, embeddable Java source interpreter with object scripting language features, written in Java. BeanShell dynamically executes standard Java syntax and extends it with common scripting conveniences such as loose types, commands, and method closures like those in Perl and JavaScript. If a BeanShell expression is built using attacker-controlled data, and then evaluated, then it may allow the attacker to run arbitrary code.


## Recommendation
It is generally recommended to avoid using untrusted input in a BeanShell expression. If it is not possible, BeanShell expressions should be run in a sandbox that allows accessing only explicitly allowed classes.


## Example
The following example uses untrusted data to build and run a BeanShell expression.

{% sample src="BeanShellInjection.java" %}

## References
* CVE-2016-2510:[BeanShell Injection](https://nvd.nist.gov/vuln/detail/CVE-2016-2510).
{% cwe-references %}
