If unsanitized user input is written to a log entry, a malicious user may able to forge new log entries.

Forgery can occur if a user provides some input with characters that are interpreted when the log output is displayed. If the log is displayed as a plain text file, then new line characters can be used by a malicious user. If the log is displayed as HTML, then arbitrary HTML may be included to spoof log entries.


## Recommendation
User input should be suitably sanitized before it is logged. Suitable means of sanitization depend on how the log entries will be displayed or consumed.

If the log entries are in plain text then line breaks should be removed from user input, using `String#gsub` or similar. Care should also be taken that user input is clearly marked in log entries.

For log entries that will be displayed in HTML, user input should be HTML-encoded before being logged, to prevent forgery and other forms of HTML injection.


## Example
In the example, a username, provided by the user, is logged using \`Logger\#info\`.

In the first case, it is logged without any sanitization. If a malicious user provides \`username=Guest%0a\[INFO\]+User:+Admin%0a\` as a username parameter, the log entry will be split in two different lines, where the second line will be \`\[INFO\]+User:+Admin\`.

{% sample src="examples/log_injection_bad.rb" %}
In the second example, `String#gsub` is used to ensure no line endings are present in the user input.

{% sample src="examples/log_injection_good.rb" %}

## References
* OWASP: [Log Injection](https://www.owasp.org/index.php/Log_Injection).
{% cwe-references %}
