An original client IP address is retrieved from an http header (`X-Forwarded-For` or `X-Real-IP` or `Proxy-Client-IP` etc.), which is used to ensure security. Attackers can forge the value of these identifiers to bypass a ban-list, for example.


## Recommendation
Do not trust the values of HTTP headers allegedly identifying the originating IP. If you are aware your application will run behind some reverse proxies then the last entry of a `X-Forwarded-For` header value may be more trustworthy than the rest of it because some reverse proxies append the IP address they observed to the end of any remote-supplied header.


## Example
The following examples show the bad case and the good case respectively. In `bad1` method and `bad2` method, the client ip the `X-Forwarded-For` is split into comma-separated values, but the less-trustworthy first one is used. Both of these examples could be deceived by providing a forged HTTP header. The method `good1` similarly splits an `X-Forwarded-For` value, but uses the last, more-trustworthy entry.

{% sample src="ClientSuppliedIpUsedInSecurityCheck.java" %}

## References
* Dennis Schneider: [ Prevent IP address spoofing with X-Forwarded-For header when using AWS ELB and Clojure Ring](https://www.dennis-schneider.com/blog/prevent-ip-address-spoofing-with-x-forwarded-for-header-and-aws-elb-in-clojure-ring/)
* Security Rule Zero: [A Warning about X-Forwarded-For](https://www.f5.com/company/blog/security-rule-zero-a-warning-about-x-forwarded-for)
{% cwe-references %}
