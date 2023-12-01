The code attempts to drop privilege in an incorrect order by erroneous dropping user privilege before groups. This has security impact if the return codes are not checked.

False positives include code performing negative checks, making sure that setgid or setgroups does not work, meaning permissions are dropped. Additionally, other forms of sandboxing may be present removing any residual risk, for example a dedicated user namespace.


## Recommendation
Set the new group ID, then set the target user's intended groups by dropping previous supplemental source groups and initializing target groups, and finally set the target user.


## Example
The following example demonstrates out of order calls.

{% sample src="PrivilegeDroppingOutoforder.c" %}

## References
* CERT C Coding Standard: [POS36-C. Observe correct revocation order while relinquishing privileges](https://wiki.sei.cmu.edu/confluence/display/c/POS36-C.+Observe+correct+revocation+order+while+relinquishing+privileges).
* CERT C Coding Standard: [POS37-C. Ensure that privilege relinquishment is successful](https://wiki.sei.cmu.edu/confluence/display/c/POS37-C.+Ensure+that+privilege+relinquishment+is+successful).
{% cwe-references %}
