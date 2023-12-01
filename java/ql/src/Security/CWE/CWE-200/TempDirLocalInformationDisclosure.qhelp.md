Local information disclosure can occur when files/directories are written into directories that are shared between all users on the system.

On most [unix-like](https://en.wikipedia.org/wiki/Unix-like) systems, the system temporary directory is shared between local users. If files/directories are created within the system temporary directory without using APIs that explicitly set the correct file permissions, local information disclosure can occur.

Depending upon the particular file contents exposed, this vulnerability can have a [CVSSv3.1 base score of 6.2/10](https://nvd.nist.gov/vuln-metrics/cvss/v3-calculator?vector=AV:L/AC:L/PR:N/UI:N/S:U/C:H/I:N/A:N&version=3.1).


## Recommendation
Use JDK methods that specifically protect against this vulnerability:

* [java.nio.file.Files.createTempDirectory](https://docs.oracle.com/javase/8/docs/api/java/nio/file/Files.html#createTempDirectory-java.nio.file.Path-java.lang.String-java.nio.file.attribute.FileAttribute...-)
* [java.nio.file.Files.createTempFile](https://docs.oracle.com/javase/8/docs/api/java/nio/file/Files.html#createTempFile-java.nio.file.Path-java.lang.String-java.lang.String-java.nio.file.attribute.FileAttribute...-)
Otherwise, create the file/directory by manually specifying the expected posix file permissions. For example: `PosixFilePermissions.asFileAttribute(EnumSet.of(PosixFilePermission.OWNER_READ, PosixFilePermission.OWNER_WRITE))`

* [java.nio.file.Files.createFile](https://docs.oracle.com/javase/8/docs/api/java/nio/file/Files.html#createFile-java.nio.file.Path-java.nio.file.attribute.FileAttribute...-)
* [java.nio.file.Files.createDirectory](https://docs.oracle.com/javase/8/docs/api/java/nio/file/Files.html#createDirectory-java.nio.file.Path-java.nio.file.attribute.FileAttribute...-)
* [java.nio.file.Files.createDirectories](https://docs.oracle.com/javase/8/docs/api/java/nio/file/Files.html#createDirectories-java.nio.file.Path-java.nio.file.attribute.FileAttribute...-)

## Example
In the following example, files and directories are created with file permissions that allow other local users to read their contents.

{% sample src="TempDirUsageVulnerable.java" %}
In the following example, files and directories are created with file permissions that protect their contents.

{% sample src="TempDirUsageSafe.java" %}

## References
* OWASP: [Insecure Temporary File](https://owasp.org/www-community/vulnerabilities/Insecure_Temporary_File).
* CERT: [FIO00-J. Do not operate on files in shared directories](https://wiki.sei.cmu.edu/confluence/display/java/FIO00-J.+Do+not+operate+on+files+in+shared+directories).
{% cwe-references %}
