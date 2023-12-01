A `lock` statement that locks a field which is modified is unlikely to provide thread safety. This is because different threads only lock the value of the field, not the field itself. Since the value of the field changes, different threads are locking different objects, and so are not mutually exclusive.


## Recommendation
Instead of locking the field itself, use a dedicated object for locking. The object should be `private` and `readonly` to ensure that it cannot be modified or locked elsewhere.


## Example
In the following example, the method `AddItem` can be called concurrently on different threads. `AddItem` attempts to protect the field `total` using a `lock` statement. However concurrent use of `AddItem` results in the value of `total` being incorrect.

{% sample src="FutileSyncOnField.cs" %}
The following code resolves this problem by using a dedicated object `mutex` for the lock.

{% sample src="FutileSyncOnFieldFix.cs" %}

## References
* MSDN, C\# Reference: [lock Statement](http://msdn.microsoft.com/en-us/library/c5kehkcz%28v=vs.110%29.aspx).
{% cwe-references %}
