Allowing file access in an Android WebView can expose a device's file system to the JavaScript running in that WebView. If the JavaScript contains vulnerabilities or the WebView loads untrusted content, file access allows an attacker to steal the user's data.


## Recommendation
When possible, do not allow file access. The file access settings are disabled by default. You can explicitly disable file access by setting the following settings to `false`:

* `setAllowFileAccess`
* `setAllowFileAccessFromFileURLs`
* `setAllowUniversalAccessFromFileURLs`
If your application requires access to the file system, it is best to avoid using `file://` URLs. Instead, use an alternative that loads files via HTTPS, such as `androidx.webkit.WebViewAssetLoader`.


## Example
In the following (bad) example, the WebView is configured with settings that allow local file access.

{% sample src="WebViewFileAccessUnsafe.java" %}
In the following (good) example, the WebView is configured to disallow file access.

{% sample src="WebViewFileAccessSafe.java" %}
As mentioned previously, asset loaders can load files without file system access. In the following (good) example, an asset loader is configured to load assets over HTTPS.

{% sample src="AssetLoaderExample.java" %}

## References
* Android documentation: [WebSettings.setAllowFileAccess](https://developer.android.com/reference/android/webkit/WebSettings#setAllowFileAccess(boolean)).
* Android documentation: [WebSettings.setAllowFileAccessFromFileURLs](https://developer.android.com/reference/android/webkit/WebSettings#setAllowFileAccessFromFileURLs(boolean)).
* Android documentation: [WebSettings.setAllowUniversalAccessFromFileURLs](https://developer.android.com/reference/android/webkit/WebSettings#setAllowUniversalAccessFromFileURLs(boolean)).
* Android documentation: [WebViewAssetLoader](https://developer.android.com/reference/androidx/webkit/WebViewAssetLoader).
{% cwe-references %}
