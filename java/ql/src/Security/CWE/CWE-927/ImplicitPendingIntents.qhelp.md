A `PendingIntent` is used to wrap an `Intent` that will be supplied and executed by another application. When the `Intent` is executed, it behaves as if it were run directly by the supplying application, using the privileges of that application.

If a `PendingIntent` is configured to be mutable, the fields of its internal `Intent` can be changed by the receiving application if they were not previously set. This means that a mutable `PendingIntent` that has not defined a destination component (that is, an implicit `PendingIntent`) can be altered to execute an arbitrary action with the privileges of the application that created it.

A malicious application can access an implicit `PendingIntent` as follows:

* It is wrapped and sent as an extra of another implicit `Intent`.
* It is sent as the action of a `Slide`.
* It is sent as the action of a `Notification`.


On gaining access, the attacker can modify the underlying `Intent` and execute an arbitrary action with elevated privileges. This could give the malicious application access to private components of the victim application, or the ability to perform actions without having the necessary permissions.


## Recommendation
Avoid creating implicit `PendingIntent`s. This means that the underlying `Intent` should always have an explicit destination component.

When you add the `PendingIntent` as an extra of another `Intent`, make sure that this second `Intent` also has an explicit destination component, so that it is not delivered to untrusted applications.

Create the `PendingIntent` using the flag `FLAG_IMMUTABLE` whenever possible, to prevent the destination component from modifying empty fields of the underlying `Intent`.


## Example
In the following examples, a `PendingIntent` is created and wrapped as an extra of another `Intent`.

In the first example, both the `PendingIntent` and the `Intent` it is wrapped in are implicit, making them vulnerable to attack.

In the second example, the issue is avoided by adding explicit destination components to the `PendingIntent` and the wrapping `Intent`.

The third example uses the `FLAG_IMMUTABLE` flag to prevent the underlying `Intent` from being modified by the destination component.

{% sample src="ImplicitPendingIntents.java" %}

## References
* Google Help: [ Remediation for Implicit PendingIntent Vulnerability ](https://support.google.com/faqs/answer/10437428?hl=en)
* University of Potsdam: [ PIAnalyzer: A precise approach for PendingIntent vulnerability analysis ](https://www.cs.uni-potsdam.de/se/papers/esorics18.pdf)
{% cwe-references %}
