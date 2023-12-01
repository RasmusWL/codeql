Apache Groovy is a powerful, optionally typed and dynamic language, with static-typing and static compilation capabilities. It integrates smoothly with any Java program, and immediately delivers to your application powerful features, including scripting capabilities, Domain-Specific Language authoring, runtime and compile-time meta-programming and functional programming. If a Groovy script is built using attacker-controlled data, and then evaluated, then it may allow the attacker to achieve RCE.


## Recommendation
It is generally recommended to avoid using untrusted input in a Groovy evaluation. If this is not possible, use a sandbox solution. Developers must also take care that Groovy compile-time metaprogramming can also lead to RCE: it is possible to achieve RCE by compiling a Groovy script (see the article "Abusing Meta Programming for Unauthenticated RCE!" linked below). Groovy's `SecureASTCustomizer` allows securing source code by controlling what code constructs are permitted. This is typically done when using Groovy for its scripting or domain specific language (DSL) features. The fundamental problem is that Groovy is a dynamic language, yet `SecureASTCustomizer` works by looking at Groovy AST statically. This makes it very easy for an attacker to bypass many of the intended checks (see \[Groovy SecureASTCustomizer is harmful\](https://kohsuke.org/2012/04/27/groovy-secureastcustomizer-is-harmful/)). Therefore, besides `SecureASTCustomizer`, runtime checks are also necessary before calling Groovy methods (see \[Improved sandboxing of Groovy scripts\](https://melix.github.io/blog/2015/03/sandboxing.html)). It is also possible to use a block-list method, excluding unwanted classes from being loaded by the JVM. This method is not always recommended, because block-lists can be bypassed by unexpected values.


## Example
The following example uses untrusted data to evaluate a Groovy script.

{% sample src="GroovyInjectionBad.java" %}
The following example uses classloader block-list approach to exclude loading dangerous classes.

{% sample src="GroovyInjectionBlocklist.java" %}

## References
* Orange Tsai: [Abusing Meta Programming for Unauthenticated RCE!](https://blog.orange.tw/2019/02/abusing-meta-programming-for-unauthenticated-rce.html).
* Cédric Champeau: [Improved sandboxing of Groovy scripts](https://melix.github.io/blog/2015/03/sandboxing.html).
* Kohsuke Kawaguchi: [Groovy SecureASTCustomizer is harmful](https://kohsuke.org/2012/04/27/groovy-secureastcustomizer-is-harmful/).
* Welk1n: [Groovy Injection payloads](https://github.com/welk1n/exploiting-groovy-in-Java/).
* Charles Chan: [Secure Groovy Script Execution in a Sandbox](https://levelup.gitconnected.com/secure-groovy-script-execution-in-a-sandbox-ea39f80ee87/).
* Eugene: [Scripting and sandboxing in a JVM environment](https://stringconcat.com/en/scripting-and-sandboxing/).
{% cwe-references %}
