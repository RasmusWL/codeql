The `"message"` event is used to send messages between windows. An untrusted window can send a message to a trusted window, and it is up to the receiver to verify the legitimacy of the message. One way of performing that verification is to check the `origin` of the message ensure that it originates from a trusted window.


## Recommendation
Always verify the origin of incoming messages.


## Example
The example below uses a received message to execute some code. However, the origin of the message is not checked, so it might be possible for an attacker to execute arbitrary code.

{% sample src="examples/MissingOriginCheckBad.js" %}
The example is fixed below, where the origin is checked to be trusted. It is therefore not possible for a malicious user to perform an attack using an untrusted origin.

{% sample src="examples/MissingOriginCheckGood.js" %}

## References
* [Window.postMessage()](https://developer.mozilla.org/en-US/docs/Web/API/Window/postMessage).
* [Web message manipulation](https://portswigger.net/web-security/dom-based/web-message-manipulation).
* [The pitfalls of postMessage](https://labs.detectify.com/2016/12/08/the-pitfalls-of-postmessage/).
{% cwe-references %}
