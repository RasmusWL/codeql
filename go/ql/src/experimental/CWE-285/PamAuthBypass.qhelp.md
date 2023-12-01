Using only a call to `pam.Authenticate` to check the validity of a login can lead to authorization bypass vulnerabilities.

A `pam.Authenticate` call only verifies the credentials of a user. It does not check if a user has an appropriate authorization to actually login. This means a user with an expired login or a password can still access the system.


## Recommendation
A call to `pam.Authenticate` should be followed by a call to `pam.AcctMgmt` to check if a user is allowed to login.


## Example
In the following example, the code only checks the credentials of a user. Hence, in this case, a user with expired credentials can still login. This can be verified by creating a new user account, expiring it with ``` chage -E0 `username`  ``` and then trying to log in.

{% sample src="PamAuthBad.go" %}
This can be avoided by calling `pam.AcctMgmt` call to verify access as has been done in the snippet shown below.

{% sample src="PamAuthGood.go" %}

## References
* Man-Page: [pam_acct_mgmt](https://man7.org/linux/man-pages/man3/pam_acct_mgmt.3.html)
{% cwe-references %}
