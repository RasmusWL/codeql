A `finalize` method that overrides the finalizer of a superclass but does not call `super.finalize` may leave system resources undisposed of or cause other cleanup actions to be left undone.


## Recommendation
Make sure that all `finalize` methods call `super.finalize` to ensure that the finalizer of its superclass is executed. Finalizer chaining is not automatic in Java.

It is also possible to defend against subclasses that do not call `super.finalize` by putting the cleanup code into a *finalizer guardian* instead of the `finalize` method. A finalizer guardian is an anonymous object instance that contains the cleanup code for the enclosing object in its `finalize` method. The only reference to the finalizer guardian is stored in a private field of the enclosing instance, which means that both the guardian and the enclosing instance can be finalized at the same time. This way, a subclass cannot block the execution of the cleanup code by not calling `super.finalize`.


## Example
In the following example, `WrongCache.finalize` does not call `super.finalize`, which means that native resources are not disposed of. However, `RightCache.finalize` *does* call `super.finalize`, which means that native resources *are* disposed of.

{% sample src="NullifiedSuperFinalize.java" %}
The following example shows a finalizer guardian.

{% sample src="NullifiedSuperFinalizeGuarded.java" %}

## References
* Java API Specification: [Object.finalize()](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/Object.html#finalize()).
* J. Bloch, *Effective Java (second edition)*, Item 7. Addison-Wesley, 2008.
{% cwe-references %}
