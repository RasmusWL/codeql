If a database query is built using string concatenation, and the components of the concatenation include user input, a user is likely to be able to run malicious database queries. This applies to various database query languages, including SQL and the Java Persistence Query Language.


## Recommendation
{% render "HowToAddress.inc.qhelp.md" %}


## Example
In the following example, the code runs a simple SQL query in two different ways.

The first way involves building a query, `query1`, by concatenating an environment variable with some string literals. The environment variable can include special characters, so this code allows for SQL injection attacks.

The second way, which shows good practice, involves building a query, `query2`, with a single string literal that includes a wildcard (`?`). The wildcard is then given a value by calling `setString`. This version is immune to injection attacks, because any special characters in the environment variable are not given any special treatment.

{% sample src="SqlTainted.java" %}

## Example
The following code shows several different ways to run a Java Persistence query.

The first example involves building a query, `query1`, by concatenating an environment variable with some string literals. Just like the SQL example, the environment variable can include special characters, so this code allows for Java Persistence query injection attacks.

The remaining examples demonstrate different methods for safely building a Java Persistence query with user-supplied values:

1. `query2` uses a single string literal that includes a placeholder for a parameter, indicated by a colon (`:`) and parameter name (`category`).
1. `query3` uses a single string literal that includes a placeholder for a parameter, indicated by a question mark (`?`) and position number (`1`).
1. `namedQuery1` is defined using the `@NamedQuery` annotation, whose `query` attribute is a string literal that includes a placeholder for a parameter, indicated by a colon (`:`) and parameter name (`category`).
1. `namedQuery2` is defined using the `@NamedQuery` annotation, whose `query` attribute includes a placeholder for a parameter, indicated by a question mark (`?`) and position number (`1`).
The parameter is then given a value by calling `setParameter`. These versions are immune to injection attacks, because any special characters in the environment variable or user-supplied value are not given any special treatment.

{% sample src="SqlTaintedPersistence.java" %}

## References
* OWASP: [SQL Injection Prevention Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/SQL_Injection_Prevention_Cheat_Sheet.html).
* SEI CERT Oracle Coding Standard for Java: [IDS00-J. Prevent SQL injection](https://wiki.sei.cmu.edu/confluence/display/java/IDS00-J.+Prevent+SQL+injection).
* The Java Tutorials: [Using Prepared Statements](https://docs.oracle.com/javase/tutorial/jdbc/basics/prepared.html).
* The Java EE Tutorial: [The Java Persistence Query Language](https://docs.oracle.com/javaee/7/tutorial/persistence-querylanguage.htm).
{% cwe-references %}
