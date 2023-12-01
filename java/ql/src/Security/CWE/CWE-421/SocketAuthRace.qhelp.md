A common pattern is to have a channel of communication open with a user, and then to open another channel, for example to transfer data. However, if user authentication is done over the original channel rather than the alternate channel, then an attacker may be able to connect to the alternate channel before the legitimate user does. This allows the attacker to impersonate the user by "piggybacking" on any previous authentication.


## Recommendation
When opening an alternate channel for an authenticated user (for example, a Java `Socket`), always authenticate the user over the new channel.


## Example
This example shows two ways of opening a connection for a user. In the first example, authentication is determined based on materials that the user has already provided (for example, their username and/or password), and then a new channel is opened. However, no authentication is done over the new channel, and so an attacker could connect to it before the user connects.

In the second example, authentication is done over the socket channel itself, which verifies that the newly connected user is in fact the user that was expected.

{% sample src="SocketAuthRace.java" %}

## References
{% cwe-references %}
