`SharedPreferences` is an Android API that stores application preferences using simple sets of data values. It allows you to easily save, alter, and retrieve the values stored in a user's profile. However, sensitive information should not be saved in cleartext. Otherwise it can be accessed by any process or user in rooted devices, or can be disclosed through chained vulnerabilities, like unexpected access to the private storage through exposed components.


## Recommendation
Use the `EncryptedSharedPreferences` API or other encryption algorithms for storing sensitive information.


## Example
In the first example, sensitive user information is stored in cleartext.

In the second and third examples, the code encrypts sensitive information before saving it to the device.

{% sample src="CleartextStorageSharedPrefs.java" %}

## References
* Android Developers: [Work with data more securely](https://developer.android.com/topic/security/data)
* ProAndroidDev: [Encrypted Preferences in Android](https://proandroiddev.com/encrypted-preferences-in-android-af57a89af7c8)
{% cwe-references %}
