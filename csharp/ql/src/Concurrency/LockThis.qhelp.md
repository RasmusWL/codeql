It is inadvisable to use `this` in a `lock` statement, because other classes could also attempt to lock the object, resulting in inefficiency or deadlock.


## Recommendation
Create a `private readonly Object` which is used exclusively for locking. This ensures that no other classes can use the same lock.


## Example
The following example uses a `private readonly` variable called `mutex` to use in the `lock` statement.

{% sample src="LockThis.cs" %}

## References
* MSDN, C\# Reference: [lock Statement](http://msdn.microsoft.com/en-gb/library/c5kehkcz.aspx).
{% cwe-references %}
