Code that builds a command line by concatenating strings that have been entered by a user allows the user to execute malicious code.


## Recommendation
Execute external commands using an array of strings rather than a single string. By using an array, many possible vulnerabilities in the formatting of the string are avoided.


## Example
In the following example, `latlonCoords` contains a string that has been entered by a user but not validated by the program. This allows the user to, for example, append an ampersand (&amp;) followed by the command for a malicious program to the end of the string. The ampersand instructs Windows to execute another program. In the block marked 'BAD', `latlonCoords` is passed to `exec` as part of a concatenated string, which allows more than one command to be executed. However, in the block marked 'GOOD', `latlonCoords` is passed as part of an array, which means that `exec` treats it only as an argument.

{% sample src="ExecUnescaped.java" %}

## References
* OWASP: [Command Injection](https://www.owasp.org/index.php/Command_Injection).
* SEI CERT Oracle Coding Standard for Java: [IDS07-J. Sanitize untrusted data passed to the Runtime.exec() method](https://wiki.sei.cmu.edu/confluence/display/java/IDS07-J.+Sanitize+untrusted+data+passed+to+the+Runtime.exec()+method).
{% cwe-references %}
