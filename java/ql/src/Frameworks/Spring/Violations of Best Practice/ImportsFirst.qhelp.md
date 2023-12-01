Putting `import` statements at the top of Spring XML bean definition files is good practice because they give a quick summary of the file's dependencies, and can even be used to document the general architecture of a system.


## Recommendation
Make sure that all `import` statements are at the top of the `<beans>` section of a Spring XML bean definition file.


## Example
The following example shows a `<beans>` section of a Spring XML bean definition file in which an `import` statement is in the middle, and a `<beans>` section in which all the `import` statements are at the top.

{% sample src="ImportsFirst.xml" %}

## References
* Spring Framework Reference Documentation 3.0: [3.2.2.1 Composing XML-based configuration metadata](http://static.springsource.org/spring/docs/3.0.x/spring-framework-reference/html/beans.html#beans-factory-xml-import).
{% cwe-references %}
