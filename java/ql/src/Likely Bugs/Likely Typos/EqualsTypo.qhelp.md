A method named `equal` may be a typographical error. `equals` may have been intended instead.


## Recommendation
Ensure that any such method is intended to have this name. Even if it is, it may be better to rename it to avoid confusion with the inherited method `Object.equals`.


## Example
The following example shows a method named `equal`. It may be better to rename it.

{% sample src="EqualsTypo.java" %}

## References
* Java API Specification: [ equals](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/Object.html#equals(java.lang.Object)).
{% cwe-references %}
