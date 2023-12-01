Some shell commands, like `git ls-remote`, can execute arbitrary commands if a user provides a malicious URL that starts with `--upload-pack`. This can be used to execute arbitrary code on the server.


## Recommendation
Sanitize user input before passing it to the shell command. For example, ensure that URLs are valid and do not contain malicious commands.


## Example
The following example shows code that executes `git ls-remote` on a URL that can be controlled by a malicious user.

{% sample src="examples/second-order-command-injection.js" %}
The problem has been fixed in the snippet below, where the URL is validated before being passed to the shell command.

{% sample src="examples/second-order-command-injection-fixed.js" %}

## References
* Max Justicz: [Hacking 3,000,000 apps at once through CocoaPods](https://justi.cz/security/2021/04/20/cocoapods-rce.html).
* Git: [Git - git-ls-remote Documentation](https://git-scm.com/docs/git-ls-remote/2.22.0#Documentation/git-ls-remote.txt---upload-packltexecgt).
* OWASP: [Command Injection](https://www.owasp.org/index.php/Command_Injection).
{% cwe-references %}
