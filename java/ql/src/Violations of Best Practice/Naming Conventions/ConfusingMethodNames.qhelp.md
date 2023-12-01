It is bad practice to have methods in a class with names that differ only in their capitalization. This can be confusing and lead to mistakes.


## Recommendation
Name the methods to make the distinction between them clear.


## Example
The following example shows a class that contains two methods: `toUri` and `toURI`. One or both of them should be renamed.

{% sample src="ConfusingMethodNames.java" %}

## References
* R. C. Martin, *Clean Code: A Handbook of Agile Software Craftsmanship*, 17.N4. Prentice Hall, 2008.
{% cwe-references %}
