Javadoc comments for public methods, constructors and generic classes should use the `@param` tag to describe the available parameters and type parameters. If the comment includes any empty, incorrect or outdated parameter names then this will make the documentation more difficult to read.


## Recommendation
The Javadoc comment for a method, constructor or generic class should always use non-empty `@param` values that match actual parameter or type parameter names.


## Example
The following example shows good and bad Javadoc comments that use the `@param` tag.

{% sample src="SpuriousJavadocParam.java" %}

## References
* Help - Eclipse Platform: [Java Compiler Javadoc Preferences](https://help.eclipse.org/2020-12/advanced/content.jsp?topic=/org.eclipse.jdt.doc.user/reference/preferences/java/compiler/ref-preferences-javadoc.htm).
* Java SE Documentation: [How to Write Doc Comments for the Javadoc Tool](https://www.oracle.com/technical-resources/articles/java/javadoc-tool.html#@param), [Documentation Comment Specification for the Standard Doclet](https://docs.oracle.com/en/java/javase/11/docs/specs/doc-comment-spec.html#param)
{% cwe-references %}
