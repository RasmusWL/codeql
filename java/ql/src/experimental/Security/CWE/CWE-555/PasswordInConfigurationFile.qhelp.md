Storing a plaintext password in a configuration file allows anyone who can read the file to access the password-protected resources.


## Recommendation
Passwords stored in configuration files should be encrypted. Utilities provided by application servers like keystore and password vault can be used to encrypt and manage passwords.


## Example
In the first example, the password of a datasource configuration is stored in cleartext in the context.xml file of a Java EE application.

In the second example, the password of a datasource configuration is encrypted and managed by a password vault.

{% sample src="context.xml" %}

## References
* CWE: [CWE-555: J2EE Misconfiguration: Plaintext Password in Configuration File](https://cwe.mitre.org/data/definitions/555.html)
* RedHat Security Guide: [Store and Retrieve Encrypted Sensitive Strings in the Java Keystore](https://access.redhat.com/documentation/en-us/jboss_enterprise_application_platform/6.1/html/security_guide/Store_and_Retrieve_Encrypted_Sensitive_Strings_in_the_Java_Keystore)
* SonarSource: [Hard-coded credentials are security-sensitive](https://rules.sonarsource.com/java/RSPEC-2068)
{% cwe-references %}
