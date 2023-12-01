Directly evaluating user input (for example, an HTTP request parameter) as code without properly sanitizing the input first allows an attacker arbitrary code execution. This can occur when user input is passed to code that interprets it as an expression to be evaluated, such as `eval` or `exec`.


## Recommendation
Avoid including user input in any expression that may be dynamically evaluated. If user input must be included, use context-specific escaping before including it. It is important that the correct escaping is used for the type of evaluation that will occur.


## Example
The following example shows two functions setting a name from a request. The first function uses `exec` to execute the `setname` function. This is dangerous as it can allow a malicious user to execute arbitrary code on the server. For example, the user could supply the value `"' + subprocess.call('rm -rf') + '"` to destroy the server's file system. The second function calls the `setname` function directly and is thus safe.

{% sample src="examples/code_injection.py" %}

## References
* OWASP: [Code Injection](https://www.owasp.org/index.php/Code_Injection).
* Wikipedia: [Code Injection](https://en.wikipedia.org/wiki/Code_injection).
{% cwe-references %}
