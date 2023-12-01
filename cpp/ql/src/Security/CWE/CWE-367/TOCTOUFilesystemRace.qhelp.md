Often it is necessary to check the state of a file before using it. These checks usually take a file name to be checked, and if the check returns positively, then the file is opened or otherwise operated upon.

However, in the time between the check and the operation, the underlying file referenced by the file name could be changed by an attacker, causing unexpected behavior.


## Recommendation
Wherever possible, use functions that operate on file descriptors rather than file names (for example, `fchmod` rather than `chmod`).

For access checks, you can temporarily change the UID and GID to that of the user whose permissions are being checked, and then perform the operation. This has the effect of "atomically" combining a permissions check with the operation.

If file-system locking tools are available on your platform, then locking the file before the check can prevent an unexpected update. However, note that on some platforms (for example, Unix) file-system locks are typically *advisory*, and so can be ignored by an attacker.


## Example
The following example shows a case where a file is opened and then, if the opening was successful, its permissions are changed with `chmod`. However, an attacker might change the target of the file name between the initial opening and the permissions change, potentially changing the permissions of a different file.

{% sample src="TOCTOUFilesystemRaceBad.c" %}
This can be avoided by using `fchmod` with the file descriptor that was received from opening the file. This ensures that the permissions change is applied to the very same file that was opened.

{% sample src="TOCTOUFilesystemRaceGood.c" %}

## References
* The CERT Oracle Secure Coding Standard for C: [ FIO01-C. Be careful using functions that use file names for identification ](https://www.securecoding.cert.org/confluence/display/c/FIO01-C.+Be+careful+using+functions+that+use+file+names+for+identification).
{% cwe-references %}
