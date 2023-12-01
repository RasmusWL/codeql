Web Cache Deception is a security vulnerability where an attacker tricks a web server into caching sensitive information and then accesses that cached data.

This attack exploits certain behaviors in caching mechanisms by requesting URLs that trick the server into thinking that a non-cachable page is cachable. If a user then accesses sensitive information on these pages, it could be cached and later retrieved by the attacker.


## Recommendation
To prevent Web Cache Deception attacks, web applications should clearly define cacheable and non-cacheable resources. Implementing strict cache controls and validating requested URLs can mitigate the risk of sensitive data being cached.


## Example
Vulnerable code example: A web server is configured to cache all responses ending in '.css'. An attacker requests 'profile.css', and the server processes 'profile', a sensitive page, and caches it.

{% sample src="WebCacheDeceptionBad.go" %}

## Example
Secure code example: The server is configured with strict cache controls and URL validation, preventing caching of dynamic or sensitive pages regardless of their URL pattern.

{% sample src="WebCacheDeceptionGood.go" %}

## References
* OWASP Web Cache Deception Attack: [Understanding Web Cache Deception Attacks](https://owasp.org/www-community/attacks/Web_Cache_Deception)
{% cwe-references %}
