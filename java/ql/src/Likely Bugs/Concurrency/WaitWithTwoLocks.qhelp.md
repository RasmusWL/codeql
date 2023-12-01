Calling `Object.wait` while two locks are held may cause deadlock, because only one lock is released by `wait`.


## Recommendation
See if one of the locks should continue to be held while waiting for a condition on the other lock. If not, release one of the locks before calling `Object.wait`.


## Example
In the following example of the problem, `printText` locks both `idLock` and `textLock` before it reads the value of `text`. It then calls `textLock.wait`, which releases the lock on `textLock`. However, `setText` needs to lock `idLock` but it cannot because `idLock` is still locked by `printText`. Thus, deadlock is caused.

{% sample src="WaitWithTwoLocks.java" %}
In the following modification of the above example, `id` and `text` are included in the class `Message`. The method `printText` synchronizes on the field `message` before it reads the value of `message.text`. It then calls `message.wait`, which releases the lock on `message`. This enables `setText` to lock `message` so that it can proceed.

{% sample src="WaitWithTwoLocksGood.java" %}

## References
* Java API Specification: [Object.wait()](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/Object.html#wait()).
{% cwe-references %}
