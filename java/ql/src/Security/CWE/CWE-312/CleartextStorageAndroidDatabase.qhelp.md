SQLite is a lightweight database engine commonly used in Android devices to store data. By itself, SQLite does not offer any encryption mechanism by default and stores all data in cleartext, which introduces a risk if sensitive data like credentials, authentication tokens or personal identifiable information (PII) are directly stored in a SQLite database. The information could be accessed by any process or user in rooted devices, or can be disclosed through chained vulnerabilities, like unexpected access to the private storage through exposed components.


## Recommendation
Use `SQLCipher` or similar libraries to add encryption capabilities to SQLite. Alternatively, encrypt sensitive data using cryptographically secure algorithms before storing it in the database.


## Example
In the first example, sensitive user information is stored in cleartext.

In the second and third examples, the code encrypts sensitive information before saving it to the database.

{% sample src="CleartextStorageAndroidDatabase.java" %}

## References
* Android Developers: [Work with data more securely](https://developer.android.com/topic/security/data)
* SQLCipher: [Android Application Integration](https://www.zetetic.net/sqlcipher/sqlcipher-for-android/)
{% cwe-references %}
