Even though the request-handling methods of `Servlet` are declared `throws IOException, ServletException`, it's a bad idea to let such exceptions be thrown. Failure to catch exceptions in a servlet could lead to exposure of sensitive information because when a servlet throws an exception, the servlet container typically sends debugging information back to the user. That information could be valuable to an attacker.


## Recommendation
Catch IOExceptions and/or RuntimeExceptions and display custom error messages without stack traces and sensitive information, or configure an `error-page` in web.xml to display a generic user-friendly message for any uncaught exception.


## Example
In the first and second examples, subclasses of IOException and RuntimeException are not caught, which disclose stack traces. Because user-controlled data is passed to methods that throw, there is an opportunity for an attacker to provoke a stack dump.

In the third example, the code catches the exception. In the fourth example, the code is not of concern since the variable cannot be controlled by attackers thus no unexpected exceptions can be thrown.

{% sample src="UncaughtServletException.java" %}

## References
* CWE: [CWE-600: Uncaught Exception in Servlet](https://cwe.mitre.org/data/definitions/600.html)
* SonarSource: [Exceptions should not be thrown from servlet methods](https://rules.sonarsource.com/java/tag/owasp/RSPEC-1989)
* OWASP: [Error Handling Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Error_Handling_Cheat_Sheet.html)
{% cwe-references %}
