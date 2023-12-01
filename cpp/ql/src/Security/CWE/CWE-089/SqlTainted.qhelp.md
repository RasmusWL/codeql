The code passes user input as part of a SQL query without escaping special elements. It generates a SQL query using `sprintf`, with the user-supplied data directly passed as an argument to `sprintf`. This leaves the code vulnerable to attack by SQL Injection.


## Recommendation
Use a library routine to escape characters in the user-supplied string before converting it to SQL.


## Example
{% sample src="SqlTainted.c" %}

## References
* MSDN Library: [SQL Injection](https://docs.microsoft.com/en-us/sql/relational-databases/security/sql-injection).
{% cwe-references %}
