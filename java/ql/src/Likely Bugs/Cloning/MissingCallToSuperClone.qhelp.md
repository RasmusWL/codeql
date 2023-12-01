A `clone` method that is overridden in a subclass should call `super.clone`. Not doing so causes the subclass `clone` to return an object of the wrong type, which violates the contract for `Cloneable`.

{% render "MissingCloneDetails.inc.qhelp.md" %}


## Recommendation
Every clone method should always use `super.clone` to construct the cloned object. This ensures that the cloned object is ultimately constructed by `Object.clone`, which uses reflection to ensure that an object of the correct runtime type is created.


## Example
In the following example, the attempt to clone `WrongEmployee` fails because `super.clone` is implemented incorrectly in its superclass `WrongPerson`.

{% sample src="MissingCallToSuperCloneBad.java" %}
However, in the following modified example, the attempt to clone `Employee` succeeds because `super.clone` is implemented correctly in its superclass `Person`.

{% sample src="MissingCallToSuperCloneGood.java" %}

## References
* J. Bloch, *Effective Java (second edition)*, Item 11. Addison-Wesley, 2008.
* Java API Specification: [Object.clone()](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/Object.html#clone()).
{% cwe-references %}
