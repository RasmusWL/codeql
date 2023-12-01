Code that passes untrusted user input directly to `child_process.exec` or similar APIs that execute shell commands allows the user to execute malicious code.


## Recommendation
If possible, use APIs that don't run shell commands and that accept command arguments as an array of strings rather than a single concatenated string. This is both safer and more portable.

If given arguments as a single string, avoid simply splitting the string on whitespace. Arguments may contain quoted whitespace, causing them to split into multiple arguments. Use a library like `shell-quote` to parse the string into an array of arguments instead.

If this approach is not viable, then add code to verify that the user input string is safe before using it.


## Example
The following example shows code that extracts a filename from an HTTP query parameter that may contain untrusted data, and then embeds it into a shell command to count its lines without examining it first:

{% sample src="examples/command-injection.js" %}
A malicious user can take advantage of this code by executing arbitrary shell commands. For example, by providing a filename like `foo.txt; rm -rf .`, the user can first count the lines in `foo.txt` and subsequently delete all files in the current directory.

To avoid this catastrophic behavior, use an API such as `child_process.execFileSync` that does not spawn a shell by default:

{% sample src="examples/command-injection_fixed.js" %}
If you want to allow the user to specify other options to `wc`, you can use a library like `shell-quote` to parse the user input into an array of arguments without risking command injection:

{% sample src="examples/command-injection_shellquote.js" %}
Alternatively, the original example can be made safe by checking the filename against an allowlist of safe characters before using it:

{% sample src="examples/command-injection_allowlist.js" %}

## References
* OWASP: [Command Injection](https://www.owasp.org/index.php/Command_Injection).
* npm: [shell-quote](https://www.npmjs.com/package/shell-quote).
{% cwe-references %}
