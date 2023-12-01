Allowing users to freely choose the name of a class to instantiate could provide means to attack a vulnerable application.


## Recommendation
Create a list of classes that are allowed to load reflectively and strictly verify the input to ensure that users can only instantiate classes or execute methods that ought to be allowed.


## Example
The `bad` method shown below illustrate class loading with `Class.forName` without any check on the particular class being instantiated. The `good` methods illustrate some different ways to restrict which classes can be instantiated.

{% sample src="UnsafeReflection.java" %}

## References
* Unsafe use of Reflection | OWASP: [Unsafe use of Reflection](https://owasp.org/www-community/vulnerabilities/Unsafe_use_of_Reflection).
* Java owasp: Classes should not be loaded dynamically: [Classes should not be loaded dynamically](https://rules.sonarsource.com/java/tag/owasp/RSPEC-2658).
{% cwe-references %}
