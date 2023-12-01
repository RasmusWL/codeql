A public method that does not have a Javadoc tag for its return value makes an API more difficult to understand and maintain.


## Recommendation
The Javadoc comment for a method should include a Javadoc tag element that describes the return value.


## Example
The following example shows a good Javadoc comment, which clearly explains the method's return value.

{% sample src="MissingJavadocMethods.java" %}

## References
* J. Bloch, *Effective Java (second edition)*, Item 44. Addison-Wesley, 2008.
* Help - Eclipse Platform: [Java Compiler Javadoc Preferences](https://help.eclipse.org/2020-12/advanced/content.jsp?topic=/org.eclipse.jdt.doc.user/reference/preferences/java/compiler/ref-preferences-javadoc.htm).
* Java SE Documentation: [How to Write Doc Comments for the Javadoc Tool](https://www.oracle.com/technical-resources/articles/java/javadoc-tool.html), [Requirements for Writing Java API Specifications](https://www.oracle.com/java/technologies/javase/api-specifications.html).
{% cwe-references %}
