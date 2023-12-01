When an Android application uses a `BroadcastReceiver` to receive intents, it is also able to receive explicit intents that are sent directly to it, regardless of its filter. Certain intent actions are only able to be sent by the operating system, not third-party applications. However, a `BroadcastReceiver` that is registered to receive system intents is still able to receive intents from a third-party application, so it should check that the intent received has the expected action. Otherwise, a third-party application could impersonate the system this way to cause unintended behavior, such as a denial of service.


## Example
In the following code, the `ShutdownReceiver` initiates a shutdown procedure upon receiving an intent, without checking that the received action is indeed `ACTION_SHUTDOWN`. This allows third-party applications to send explicit intents to this receiver to cause a denial of service.

{% sample src="Bad.java" %}
{% sample src="AndroidManifest.xml" %}

## Recommendation
In the `onReceive` method of a `BroadcastReceiver`, the action of the received Intent should be checked. The following code demonstrates this.

{% sample src="Good.java" %}

## References
{% cwe-references %}
