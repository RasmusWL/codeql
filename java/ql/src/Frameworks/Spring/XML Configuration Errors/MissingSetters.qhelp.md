The absence of a matching setter method for a property that is defined in a Spring XML bean causes a validation error when the project is compiled.


## Recommendation
Ensure that there is a setter method in the bean file that matches the property name.


## Example
The following example shows a bean file in which there is no match for the setter method that is in the class.

{% sample src="MissingSetters.xml" %}
This is the bean class.

{% sample src="MissingSetters.java" %}
The property `transactionHelper` should instead have the name `helper`.


## References
* Spring Framework Reference Documentation 3.0: [3.4.1.2 Setter-based dependency injection](http://static.springsource.org/spring/docs/3.0.x/spring-framework-reference/html/beans.html#beans-setter-injection).
{% cwe-references %}
