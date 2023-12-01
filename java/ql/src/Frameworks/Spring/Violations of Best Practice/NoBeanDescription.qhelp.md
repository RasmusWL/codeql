In a Spring XML bean definition file, adding a `<description>` element to a `<bean>` element or the enclosing `<beans>` element to document the purpose of the bean specification is good practice. A `description` element also has the advantage of making it easier for tools to detect and display the documentation for your bean specifications.


## Recommendation
Add a `<description>` element either in the `<bean>` element or its enclosing `<beans>` element.


## Example
The following example shows a Spring XML bean definition file that includes `<description>` elements.

{% sample src="NoBeanDescription.xml" %}

## References
* ONJava: [Twelve Best Practices For Spring XML Configurations](http://onjava.com/pub/a/onjava/2006/01/25/spring-xml-configuration-best-practices.html?page=3).
{% cwe-references %}
