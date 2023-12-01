If a SQL query is built using string concatenation, and the components of the concatenation include user input, a user is likely to be able to run malicious database queries.


## Recommendation
Usually, it is better to use a prepared statement than to build a complete query with string concatenation. A prepared statement can include a parameter, written as either a question mark (`?`) or with an explicit name (`@parameter`), for each part of the SQL query that is expected to be filled in by a different value each time it is run. When the query is later executed, a value must be supplied for each parameter in the query.

It is good practice to use prepared statements for supplying parameters to a query, whether or not any of the parameters are directly traceable to user input. Doing so avoids any need to worry about quoting and escaping.


## Example
In the following example, the code runs a simple SQL query in three different ways.

The first way involves building a query, `query1`, by concatenating a user-supplied text box value with some string literals. The text box value can include special characters, so this code allows for SQL injection attacks.

The second way uses a stored procedure, `ItemsStoredProcedure`, with a single parameter (`@category`). The parameter is then given a value by calling `Parameters.Add`. This version is immune to injection attacks, because any special characters are not given any special treatment.

The third way builds a query, `query2`, with a single string literal that includes a parameter (`@category`). The parameter is then given a value by calling `Parameters.Add`. This version is immune to injection attacks, because any special characters are not given any special treatment.

{% sample src="SqlInjection.cs" %}

## References
* MSDN: [How To: Protect From SQL Injection in ASP.NET](https://msdn.microsoft.com/en-us/library/ff648339.aspx).
{% cwe-references %}
