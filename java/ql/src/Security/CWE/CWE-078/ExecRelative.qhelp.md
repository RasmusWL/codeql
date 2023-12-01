When a command is executed with a relative path, the runtime uses the PATH environment variable to find which executable to run. Therefore, any user who can change the PATH environment variable can cause the software to run a different, malicious executable.


## Recommendation
In most cases, simply use a command that has an absolute path instead of a relative path.

In some cases, the location of the executable might be different on different installations. In such cases, consider specifying the location of key executables with some form of configuration. When using this approach, be careful that the configuration system is not itself vulnerable to malicious modifications.


## Example
{% sample src="ExecRelative.java" %}

## References
{% cwe-references %}
