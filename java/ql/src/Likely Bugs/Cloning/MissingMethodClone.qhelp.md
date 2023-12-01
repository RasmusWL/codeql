A class that implements `Cloneable` should override `Object.clone`. For non-trivial objects, the `Cloneable` contract requires a deep copy of the object's internal state. A class that does not have a `clone` method indicates that the class is breaking the contract and will have undesired behavior.

{% render "MissingCloneDetails.inc.qhelp.md" %}


## Recommendation
The necessity of creating a deep copy of an object's internal state means that, for most objects, `clone` must be overridden to satisfy the `Cloneable` contract. Implement a `clone` method that properly creates the internal state of the cloned object.

Notable exceptions to this recommendation are:

* Classes that contain only primitive types (which will be properly cloned by `Object.clone` as long as its `Cloneable` supertypes all call `super.clone`).
* Subclasses of `Cloneable` classes that do not introduce new state.

## Example
In the following example, `WrongStack` does not implement `clone`. This means that when `ws1clone` is cloned from `ws1`, the default `clone` implementation is used. This results in operations on the `ws1clone` stack affecting the `ws1` stack.

{% sample src="MissingMethodCloneBad.java" %}
In the following modified example, `RightStack` *does* implement `clone`. This means that when `rs1clone` is cloned from `rs1`, operations on the `rs1clone` stack do not affect the `rs1` stack.

{% sample src="MissingMethodCloneGood.java" %}

## References
* J. Bloch, *Effective Java (second edition)*, Item 11. Addison-Wesley, 2008.
* Java API Specification: [Object.clone()](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/Object.html#clone()).
{% cwe-references %}
