This query indicates that a call is setting the DACL field in a `SECURITY_DESCRIPTOR` to null.

When using `SetSecurityDescriptorDacl` to set a discretionary access control (DACL), setting the `bDaclPresent` argument to `TRUE` indicates the presence of a DACL in the security description in the argument `pDacl`.

When the `pDacl` parameter does not point to a DACL (i.e. it is `NULL`) and the `bDaclPresent` flag is `TRUE`, a `NULL DACL` is specified.

A `NULL DACL` grants full access to any user who requests it; normal security checking is not performed with respect to the object.


## Recommendation
You should not use a `NULL DACL` with an object because any user can change the DACL and owner of the security descriptor.


## Example
In the following example, the call to `SetSecurityDescriptorDacl` is setting an unsafe DACL (`NULL DACL`) to the security descriptor.

{% sample src="UnsafeDaclSecurityDescriptor.cpp" %}
To fix this issue, `pDacl` argument should be a pointer to an `ACL` structure that specifies the DACL for the security descriptor.


## References
* [SetSecurityDescriptorDacl function (Microsoft documentation).](https://docs.microsoft.com/en-us/windows/desktop/api/securitybaseapi/nf-securitybaseapi-setsecuritydescriptordacl)
{% cwe-references %}
