Calling the `addJavascriptInterface` method of the `android.webkit.WebView` class allows the web pages of a WebView to access a Java object's methods via JavaScript.

Objects exposed to JavaScript are available in all frames of the WebView.


## Recommendation
If you need to expose Java objects to JavaScript, guarantee that no untrusted third-party content is loaded into the WebView.


## Example
In the following (bad) example, a Java object is exposed to JavaScript.

{% sample src="AndroidWebViewAddJavascriptInterfaceExample.java" %}

## References
* Android Documentation: [addJavascriptInterface](https://developer.android.com/reference/android/webkit/WebView#addJavascriptInterface(java.lang.Object,%20java.lang.String))
{% cwe-references %}
