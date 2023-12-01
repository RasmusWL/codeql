Working with changing directories, without checking the return value or pinning the directory, may not be safe. Requires the attention of developers.


## Example
The following example demonstrates erroneous and corrected work with changing working directories.

{% sample src="IncorrectChangingWorkingDirectory.cpp" %}

## References
* CERT C Coding Standard: [POS05-C. Limit access to files by creating a jail.](https://wiki.sei.cmu.edu/confluence/display/c/POS05-C.+Limit+access+to+files+by+creating+a+jail)
{% cwe-references %}
