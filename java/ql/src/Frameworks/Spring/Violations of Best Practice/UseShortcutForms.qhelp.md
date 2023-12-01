Shortcut forms, introduced in Spring 1.2, allow nested `value` elements to instead be defined as attributes in the enclosing `property` entry. This leads to shorter XML bean configurations that are easier to read.


## Recommendation
When possible, use the shortcut form for defining bean property values.

Note that this does *not* apply to `idref` elements, which are the preferred form of referring to another bean. These do not have a shortcut form that can still be checked by the XML parser.


## Example
The following example shows how a bean that is defined using shortcut forms is more concise than the same bean defined using nested `value` elements.

{% sample src="UseShortcutForms.xml" %}

## References
* ONJava: [Twelve Best Practices for Spring XML Configurations](http://www.onjava.com/pub/a/onjava/2006/01/25/spring-xml-configuration-best-practices.html?page=1).
* Spring Framework Reference Documentation 3.0: [3.4.2.1 Straight values (primitives, Strings, and so on)](http://static.springsource.org/spring/docs/3.0.x/spring-framework-reference/html/beans.html#beans-value-element).
{% cwe-references %}
