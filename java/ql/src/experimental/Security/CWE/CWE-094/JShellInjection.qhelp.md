The Java Shell tool (JShell) is an interactive tool for learning the Java programming language and prototyping Java code. JShell is a Read-Evaluate-Print Loop (REPL), which evaluates declarations, statements, and expressions as they are entered and immediately shows the results. If an expression is built using attacker-controlled data and then evaluated, it may allow the attacker to run arbitrary code.


## Recommendation
It is generally recommended to avoid using untrusted input in a JShell expression. If it is not possible, JShell expressions should be run in a sandbox that allows accessing only explicitly allowed classes.


## Example
The following example calls `JShell.eval(...)` or `SourceCodeAnalysis.wrappers(...)` to execute untrusted data.

{% sample src="JShellInjection.java" %}

## References
* Java Shell User’s Guide: [Introduction to JShell](https://docs.oracle.com/en/java/javase/11/jshell/introduction-jshell.html)
{% cwe-references %}
