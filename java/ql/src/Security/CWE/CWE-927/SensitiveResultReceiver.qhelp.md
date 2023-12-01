If a `ResultReceiver` is obtained from an untrusted source, such as an `Intent` received by an exported component, do not send it sensitive data. Otherwise, the information may be leaked to a malicious application.


## Recommendation
Do not send sensitive data to an untrusted `ResultReceiver`.


## Example
In the following (bad) example, sensitive data is sent to an untrusted `ResultReceiver`.

{% sample src="SensitiveResultReceiver.java" %}

## References
{% cwe-references %}
