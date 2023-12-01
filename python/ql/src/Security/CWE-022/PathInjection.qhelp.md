Accessing files using paths constructed from user-controlled data can allow an attacker to access unexpected resources. This can result in sensitive information being revealed or deleted, or an attacker being able to influence behavior by modifying unexpected files.


## Recommendation
Validate user input before using it to construct a file path, either using an off-the-shelf library function like `werkzeug.utils.secure_filename`, or by performing custom validation.

Ideally, follow these rules:

* Do not allow more than a single "." character.
* Do not allow directory separators such as "/" or "\\" (depending on the file system).
* Do not rely on simply replacing problematic sequences such as "../". For example, after applying this filter to ".../...//", the resulting string would still be "../".
* Use an allowlist of known good patterns.

## Example
In the first example, a file name is read from an HTTP request and then used to access a file. However, a malicious user could enter a file name that is an absolute path, such as `"/etc/passwd"`.

In the second example, it appears that the user is restricted to opening a file within the `"user"` home directory. However, a malicious user could enter a file name containing special characters. For example, the string `"../../../etc/passwd"` will result in the code reading the file located at `"/server/static/images/../../../etc/passwd"`, which is the system's password file. This file would then be sent back to the user, giving them access to all the system's passwords. Note that a user could also use an absolute path here, since the result of `os.path.join("/server/static/images/", "/etc/passwd")` is `"/etc/passwd"`.

In the third example, the path used to access the file system is normalized *before* being checked against a known prefix. This ensures that regardless of the user input, the resulting path is safe.

{% sample src="examples/tainted_path.py" %}

## References
* OWASP: [Path Traversal](https://owasp.org/www-community/attacks/Path_Traversal).
* npm: [werkzeug.utils.secure_filename](http://werkzeug.pocoo.org/docs/utils/#werkzeug.utils.secure_filename).
{% cwe-references %}
