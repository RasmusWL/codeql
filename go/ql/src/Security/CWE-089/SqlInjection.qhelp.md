If a database query (such as an SQL or NoSQL query) is built from user-provided data without sufficient sanitization, a malicious user may be able to run commands that exfiltrate, tamper with, or destroy data stored in the database.


## Recommendation
Most database connector libraries offer a way of safely embedding untrusted data into a query by means of query parameters or prepared statements. Use these features rather than building queries by string concatenation.


## Example
In the following example, assume the function `handler` is an HTTP request handler in a web application, whose parameter `req` contains the request object:

{% sample src="SqlInjection.go" %}
The handler constructs an SQL query involving user input taken from the request object unsafely using `fmt.Sprintf` to embed a request parameter directly into the query string `q`. The parameter may include quote characters, allowing a malicious user to terminate the string literal into which the parameter is embedded and add arbitrary SQL code after it.

Instead, the untrusted query parameter should be safely embedded using placeholder parameters:

{% sample src="SqlInjectionGood.go" %}

## References
* Wikipedia: [SQL injection](https://en.wikipedia.org/wiki/SQL_injection).
{% cwe-references %}
