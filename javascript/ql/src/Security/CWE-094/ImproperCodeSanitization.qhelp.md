Using string concatenation to construct JavaScript code can be error-prone, or in the worst case, enable code injection if an input is constructed by an attacker.


## Recommendation
If using `JSON.stringify` or an HTML sanitizer to sanitize a string inserted into JavaScript code, then make sure to perform additional sanitization or remove potentially dangerous characters.


## Example
The example below constructs a function that assigns the number 42 to the property `key` on an object `obj`. However, if `key` contains `</script>`, then the generated code will break out of a `</script>` if inserted into a `</script>` tag.

{% sample src="examples/ImproperCodeSanitization.js" %}
The issue has been fixed by escaping potentially dangerous characters, as shown below.

{% sample src="examples/ImproperCodeSanitizationFixed.js" %}

## References
* OWASP: [Code Injection](https://www.owasp.org/index.php/Code_Injection).
{% cwe-references %}
