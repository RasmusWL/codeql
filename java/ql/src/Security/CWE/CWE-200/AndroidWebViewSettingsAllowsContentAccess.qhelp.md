Android can provide access to content providers within a WebView using the `setAllowContentAccess` setting.

Allowing access to content providers via `content://` URLs may allow JavaScript to access protected content.


## Recommendation
If your app does not require access to the `content://` URL functionality, you should explicitly disable the setting by calling `setAllowContentAccess(false)` on the settings of the WebView.


## Example
In the following (bad) example, access to `content://` URLs is explicitly allowed.

{% sample src="ContentAccessEnabled.java" %}
In the following (good) example, access to `content://` URLs is explicitly denied.

{% sample src="ContentAccessDisabled.java" %}

## References
* Android Documentation: [setAllowContentAccess](https://developer.android.com/reference/android/webkit/WebSettings#setAllowContentAccess(boolean)).
{% cwe-references %}
