Web browsers, by default, disallow cross-origin resource sharing via direct HTTP requests (i.e. using a JavaScript HTTP client). Still, to satisfy some needs that arose with the growth of the web, an expedient was created to make exceptions possible. CORS (Cross-origin resource sharing) is a mechanism that allows resources of a web endpoint (let's call it "Peer A") to be accessed from another web page belonging to a different domain ("Peer B").

For that to happen, Peer A needs to make available its CORS configuration via special headers on the desired endpoint via the OPTIONS method.

This configuration can also allow the inclusion of cookies on the cross-origin request, (i.e. when the `Access-Control-Allow-Credentials` header is set to true) meaning that Peer B can send a request to Peer A that will include the cookies as if the request was executed by the user.

That can have dangerous effects if Peer B origin is not restricted correctly. An example of a dangerous scenario is when `Access-Control-Allow-Origin` header is set to a value gotten from the Peer B's request (and not correctly validated), or is set to special values such as `*` or `null`. The above values can allow any Peer B to send requests to the misconfigured Peer A on behalf of the user.

Example scenario: User is client of a bank that has its API misconfigured to accept CORS requests from any domain. When the user loads an evil page, the evil page sends a request to the bank's API to transfer all funds to evil party's account. Given that the user was already logged in to the bank website, and had its session cookies set, the evil party's request succeeds.


## Recommendation
When configuring CORS that allow credentials passing, it's best not to use user-provided values for the allowed origins response header, especially if the cookies grant session permissions on the user's account.

It also can be very dangerous to set the allowed origins to `null` (which can be bypassed).


## Example
The first example shows a few possible CORS misconfiguration cases:

{% sample src="CorsMisconfigurationBad.go" %}
The second example show better configurations:

{% sample src="CorsMisconfigurationGood.go" %}

## References
* Reference 1: [PortSwigger Web Security Academy on CORS](https://portswigger.net/web-security/cors).
* Reference 2: [AppSec EU 2017 Exploiting CORS Misconfigurations For Bitcoins And Bounties by James Kettle](https://www.youtube.com/watch?v=wgkj4ZgxI4c).
{% cwe-references %}
