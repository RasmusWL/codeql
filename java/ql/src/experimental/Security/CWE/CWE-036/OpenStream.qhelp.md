Calling `openStream` on URLs created from remote source can lead to local file disclosure.

If `openStream` is called on a `java.net.URL`, that was created from a remote source, an attacker can try to pass absolute URLs starting with `file://` or `jar://` to access local resources in addition to remote ones.


## Recommendation
When you construct a URL using `java.net.URL` from a remote source, don't call `openStream` on it. Instead, use an HTTP Client to fetch the URL and access its content. You should also validate the URL to check that it uses the correct protocol and host combination.


## Example
The following example shows an URL that is constructed from a request parameter. Afterwards `openStream` is called on the URL, potentially leading to a local file access.

{% sample src="OpenStream.java" %}

## References
* Java API Specification: [ Class URL](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/net/URL.html).
{% cwe-references %}
