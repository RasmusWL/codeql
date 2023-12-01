Azure Storage .NET, Java, and Python SDKs support encryption on the client with a customer-managed key that is maintained in Azure Key Vault or another key store.

Current release versions of the Azure Storage SDKs use cipher block chaining (CBC mode) for client-side encryption (referred to as `v1`).


## Recommendation
Consider switching to `v2` client-side encryption.


## Example
{% sample src="UnsafeUsageOfClientSideEncryptionVersion.py" %}

## References
* [Azure Storage Client Encryption Blog.](http://aka.ms/azstorageclientencryptionblog)
* [CVE-2022-30187](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-30187)
{% cwe-references %}
