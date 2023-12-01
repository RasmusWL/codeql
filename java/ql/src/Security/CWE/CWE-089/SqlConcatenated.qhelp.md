Even when the components of a SQL query are not fully controlled by a user, it is a vulnerability to build the query by directly concatenating those components. Perhaps a separate vulnerability will allow the user to gain control of the component. As well, a user who cannot gain full control of an input might influence it enough to cause the SQL query to fail to run.


## Recommendation
{% render "HowToAddress.inc.qhelp.md" %}


## Example
In the following example, the code runs a simple SQL query in two different ways.

The first way involves building a query, `query1`, by concatenating the result of `getCategory` with some string literals. The result of `getCategory` can include special characters, or it might be refactored later so that it may return something that contains special characters.

The second way, which shows good practice, involves building a query, `query2`, with a single string literal that includes a wildcard (`?`). The wildcard is then given a value by calling `setString`. This version is immune to injection attacks, because any special characters in the result of `getCategory` are not given any special treatment.

{% sample src="SqlConcatenated.java" %}

## References
* OWASP: [SQL Injection Prevention Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/SQL_Injection_Prevention_Cheat_Sheet.html).
* SEI CERT Oracle Coding Standard for Java: [IDS00-J. Prevent SQL injection](https://wiki.sei.cmu.edu/confluence/display/java/IDS00-J.+Prevent+SQL+injection).
* The Java Tutorials: [Using Prepared Statements](https://docs.oracle.com/javase/tutorial/jdbc/basics/prepared.html).
{% cwe-references %}
