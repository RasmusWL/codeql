HTTP request handlers should not perform expensive operations such as accessing the file system, executing an operating system command or interacting with a database without limiting the rate at which requests are accepted. Otherwise, the application becomes vulnerable to denial-of-service attacks where an attacker can cause the application to crash or become unresponsive by issuing a large number of requests at the same time.


## Recommendation
A rate-limiting middleware should be used to prevent such attacks.


## Example
The following example shows an Express application that serves static files without rate limiting:

{% sample src="examples/MissingRateLimiting.js" %}
To prevent denial-of-service attacks, the `express-rate-limit` package can be used:

{% sample src="examples/MissingRateLimitingGood.js" %}

## References
* OWASP: [Denial of Service Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Denial_of_Service_Cheat_Sheet.html).
* Wikipedia: [Denial-of-service attack](https://en.wikipedia.org/wiki/Denial-of-service_attack).
* NPM: [express-rate-limit](https://www.npmjs.com/package/express-rate-limit).
{% cwe-references %}
