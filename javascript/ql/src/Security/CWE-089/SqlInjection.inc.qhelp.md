If a database query (such as a SQL or NoSQL query) is built from user-provided data without sufficient sanitization, a malicious user may be able to run malicious database queries.


## Recommendation
Most database connector libraries offer a way of safely embedding untrusted data into a query by means of query parameters or prepared statements.

For NoSQL queries, make use of an operator like MongoDB's `$eq` to ensure that untrusted data is interpreted as a literal value and not as a query object. Alternatively, check that the untrusted data is a literal value and not a query object before using it in a query.

For SQL queries, use query parameters or prepared statements to embed untrusted data into the query string, or use a library like `sqlstring` to escape untrusted data.


## Example
In the following example, assume the function `handler` is an HTTP request handler in a web application, whose parameter `req` contains the request object.

The handler constructs an SQL query string from user input and executes it as a database query using the `pg` library. The user input may contain quote characters, so this code is vulnerable to a SQL injection attack.

{% sample src="examples/SqlInjection.js" %}
To fix this vulnerability, we can use query parameters to embed the user input into the query string. In this example, we use the API offered by the `pg` Postgres database connector library, but other libraries offer similar features. This version is immune to injection attacks.

{% sample src="examples/SqlInjectionFix.js" %}
Alternatively, we can use a library like `sqlstring` to escape the user input before embedding it into the query string:

{% sample src="examples/SqlInjectionFix2.js" %}

## Example
In the following example, an express handler attempts to delete a single document from a MongoDB collection. The document to be deleted is identified by its `_id` field, which is constructed from user input. The user input may contain a query object, so this code is vulnerable to a NoSQL injection attack.

{% sample src="examples/NoSqlInjection.js" %}
To fix this vulnerability, we can use the `$eq` operator to ensure that the user input is interpreted as a literal value and not as a query object:

{% sample src="examples/NoSqlInjectionFix.js" %}
Alternatively check that the user input is a literal value and not a query object before using it:

{% sample src="examples/NoSqlInjectionFix2.js" %}

## References
* Wikipedia: [SQL injection](https://en.wikipedia.org/wiki/SQL_injection).
* MongoDB: [$eq operator](https://docs.mongodb.com/manual/reference/operator/query/eq).
* OWASP: [NoSQL injection](https://owasp.org/www-pdf-archive/GOD16-NOSQL.pdf).
{% cwe-references %}
