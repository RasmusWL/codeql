Locks held concurrently should be locked in a consistent sequence, otherwise the program can deadlock. This rule detects nested `lock` statements that lock variables in a different sequence in different parts of the program.


## Recommendation
This problem can be avoided by ensuring that nested `lock` statements always lock variables in the same sequence.


## Example
The following example shows a program running two threads, which deadlocks because `thread1` holds `lock1` and is waiting to acquire `lock2`, whilst `thread2` holds `lock2` and is waiting to acquire `lock1`.

{% sample src="LockOrderBad.cs" %}
This problem is resolved by reordering the `lock` variables as shown below.

{% sample src="LockOrderGood.cs" %}

## References
* MSDN, C\# Reference: [lock Statement](http://msdn.microsoft.com/en-us/library/c5kehkcz%28v=vs.110%29.aspx).
* The CERT Oracle Coding Standard for Java: [ LCK07-J. Avoid deadlock by requesting and releasing locks in the same order](https://www.securecoding.cert.org/confluence/display/java/LCK07-J.+Avoid+deadlock+by+requesting+and+releasing+locks+in+the+same+order).
{% cwe-references %}
