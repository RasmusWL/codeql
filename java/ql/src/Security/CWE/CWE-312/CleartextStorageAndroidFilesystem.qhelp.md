Android applications with the appropriate permissions can write files either to the device external storage or the application internal storage, depending on the application's needs. However, sensitive information should not be saved in cleartext. Otherwise it can be accessed by any process or user in rooted devices, or can be disclosed through chained vulnerabilities, like unexpected access to the private storage through exposed components.


## Recommendation
Consider using the `EncryptedFile` class to work with files containing sensitive data. Alternatively, use encryption algorithms to encrypt the sensitive data being stored.


## Example
In the first example, sensitive user information is stored in cleartext using a local file.

In the second and third examples, the code encrypts sensitive information before saving it to the filesystem.

{% sample src="CleartextStorageAndroidFilesystem.java" %}

## References
* Android Developers: [Work with data more securely](https://developer.android.com/topic/security/data)
* Android Developers: [EncryptedFile](https://developer.android.com/reference/androidx/security/crypto/EncryptedFile)
{% cwe-references %}
