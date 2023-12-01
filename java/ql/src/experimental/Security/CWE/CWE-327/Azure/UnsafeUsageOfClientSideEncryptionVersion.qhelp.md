Azure Storage .NET, Java, and Python SDKs support encryption on the client with a customer-managed key that is maintained in Azure Key Vault or another key store.

The Azure Storage SDK version 12.18.0 or later supports version `V2` for client-side encryption. All previous versions of Azure Storage SDK only support client-side encryption `V1` which is unsafe.


## Recommendation
Consider switching to `V2` client-side encryption.


## Example
{% sample src="UnsafeUsageOfClientSideEncryptionVersion.java" %}

## References
* [Azure Storage Client Encryption Blog.](http://aka.ms/azstorageclientencryptionblog)
* [CVE-2022-30187](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-30187)
{% cwe-references %}
