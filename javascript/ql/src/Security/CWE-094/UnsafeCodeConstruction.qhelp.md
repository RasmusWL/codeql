When a library function dynamically constructs code in a potentially unsafe way, then it's important to document to clients of the library that the function should only be used with trusted inputs. If the function is not documented as being potentially unsafe, then a client may incorrectly use inputs containing unsafe code fragments, and thereby leave the client vulnerable to code-injection attacks.


## Recommendation
Properly document library functions that construct code from unsanitized inputs, or avoid constructing code in the first place.


## Example
The following example shows two methods implemented using \`eval\`: a simple deserialization routine and a getter method. If untrusted inputs are used with these methods, then an attacker might be able to execute arbitrary code on the system.

{% sample src="examples/UnsafeCodeConstruction.js" %}
To avoid this problem, either properly document that the function is potentially unsafe, or use an alternative solution such as \`JSON.parse\` or another library, like in the examples below, that does not allow arbitrary code to be executed.

{% sample src="examples/UnsafeCodeConstructionSafe.js" %}

## References
* OWASP: [Code Injection](https://www.owasp.org/index.php/Code_Injection).
* Wikipedia: [Code Injection](https://en.wikipedia.org/wiki/Code_injection).
{% cwe-references %}
