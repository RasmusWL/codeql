If `Kernel.open` is given a file name that starts with a `|` character, it will execute the remaining string as a shell command. If a malicious user can control the file name, they can execute arbitrary code. The same vulnerability applies to `IO.read`, `IO.write`, `IO.binread`, `IO.binwrite`, `IO.foreach`, `IO.readlines` and `URI.open`.


## Recommendation
Use `File.open` instead of `Kernel.open`, as the former does not have this vulnerability. Similarly, use the methods from the `File` class instead of the `IO` class e.g. `File.read` instead of `IO.read`.

Instead of `URI.open` use `URI(..).open` or an HTTP Client.


## Example
The following example shows code that calls `Kernel.open` on a user-supplied file path.

{% sample src="examples/kernel_open.rb" %}
Instead, `File.open` should be used, as in the following example.

{% sample src="examples/file_open.rb" %}

## References
* OWASP: [Command Injection](https://www.owasp.org/index.php/Command_Injection). [Ruby on Rails Cheat Sheet: Command Injection](https://cheatsheetseries.owasp.org/cheatsheets/Ruby_on_Rails_Cheat_Sheet.html#command-injection).
* Example CVE: [Command Injection in RDoc](https://www.ruby-lang.org/en/news/2021/05/02/os-command-injection-in-rdoc/).
{% cwe-references %}
