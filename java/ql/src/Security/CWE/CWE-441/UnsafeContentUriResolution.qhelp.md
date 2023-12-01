When an Android application wants to access data in a content provider, it uses the `ContentResolver` object. `ContentResolver`s communicate with an instance of a class that implements the `ContentProvider` interface via URIs with the `content://` scheme. The authority part (the first path segment) of the URI, passed as parameter to the `ContentResolver`, determines which content provider is contacted for the operation. Specific operations that act on files also support the `file://` scheme, in which case the local filesystem is queried instead. If an external component, like a malicious or compromised application, controls the URI for a `ContentResolver` operation, it can trick the vulnerable application into accessing its own private files or non-exported content providers. The attacking application might be able to get access to the file by forcing it to be copied to a public directory, like external storage, or tamper with the contents by making the application overwrite the file with unexpected data.


## Recommendation
If possible, avoid using externally-provided data to determine the URI for a `ContentResolver` to use. If that is not an option, validate that the incoming URI can only reference trusted components, like an allow list of content providers and/or applications, or alternatively make sure that the URI does not reference private directories like `/data/`.


## Example
This example shows three ways of opening a file using a `ContentResolver`. In the first case, externally-provided data from an intent is used directly in the file-reading operation. This allows an attacker to provide a URI of the form `/data/data/(vulnerable app package)/(private file)` to trick the application into reading it and copying it to the external storage. In the second case, an insufficient check is performed on the externally-provided URI, still leaving room for exploitation. In the third case, the URI is correctly validated before being used, making sure it does not reference any internal application files.

{% sample src="UnsafeContentUriResolution.java" %}

## References
* Android developers: [Content provider basics](https://developer.android.com/guide/topics/providers/content-provider-basics)
* [The ContentResolver class](https://developer.android.com/reference/android/content/ContentResolver)
{% cwe-references %}
