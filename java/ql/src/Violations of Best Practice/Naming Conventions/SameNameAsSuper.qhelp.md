A class that has the same name as its superclass may be confusing.


## Recommendation
Clarify the difference between the subclass and the superclass by using different names.


## Example
In the following example, it is not clear that the `attendees` field refers to the inner class `Attendees` and not the class `com.company.util.Attendees`.

{% sample src="SameNameAsSuper.java" %}
To fix this, the inner class should be renamed.


## References
* R. C. Martin, *Clean Code: A Handbook of Agile Software Craftsmanship*, &sect;17.N4. Prentice Hall, 2008.
{% cwe-references %}
