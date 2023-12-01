Credentials management issues occur when credentials are stored in plaintext in an application's properties file. Common credentials include but are not limited to LDAP, mail, database, proxy account, and so on. Storing plaintext credentials in a properties file allows anyone who can read the file access to the protected resource. Good credentials management guidelines require that credentials never be stored in plaintext.


## Recommendation
Credentials stored in properties files should be encrypted and recycled regularly. In a Java EE deployment scenario, utilities provided by application servers like keystores and password vaults can be used to encrypt and manage credentials.


## Example
In the first example, the credentials for the LDAP and datasource properties are stored in cleartext in the properties file.

In the second example, the credentials for the LDAP and datasource properties are stored in an encrypted format.

{% sample src="configuration.properties" %}

## References
* OWASP: [Password Plaintext Storage](https://owasp.org/www-community/vulnerabilities/Password_Plaintext_Storage)
* Medium (Rajeev Shukla): [Encrypting database password in the application.properties file](https://medium.com/@mail2rajeevshukla/hiding-encrypting-database-password-in-the-application-properties-34d59fe104eb)
{% cwe-references %}
