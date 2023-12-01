JxBrowser is a Java library that allows to embed the Chromium browser inside Java applications. Versions smaller than 6.24 by default ignore any HTTPS certificate errors thereby allowing man-in-the-middle attacks.


## Recommendation
Do either of these:

* Update to version 6.24 or 7.x.x as these correctly reject certificate errors by default.
* Add a custom implementation of the `LoadHandler` interface whose `onCertificateError` method always returns **true** indicating that loading should be cancelled. Then use the `setLoadHandler` method with your custom `LoadHandler` on every `Browser` you use.

## Example
The following two examples show two ways of using a `Browser`. In the 'BAD' case, all certificate errors are ignored. In the 'GOOD' case, certificate errors are rejected.

{% sample src="JxBrowserWithoutCertValidation.java" %}

## References
* Teamdev: [ Changelog of JxBrowser 6.24](https://jxbrowser-support.teamdev.com/release-notes/2019/v6-24.html).
{% cwe-references %}
