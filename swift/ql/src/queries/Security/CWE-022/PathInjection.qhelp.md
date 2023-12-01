Accessing paths controlled by users can expose resources to attackers.

Paths that are naively constructed from data controlled by a user may contain unexpected special characters, such as `..`. Such a path could point to any directory on the file system.


## Recommendation
Validate user input before using it to construct a file path. Ideally, follow these rules:

* Do not allow more than a single `.` character.
* Do not allow directory separators such as `/` or `\` (depending on the file system).
* Do not rely on simply replacing problematic sequences such as `../`. For example, after applying this filter to `.../...//` the resulting string would still be `../`.
* Use a whitelist of known good patterns.

## Example
The following code shows two bad examples.

{% sample src="PathInjectionBad.swift" %}
In the first, a file name is read from an HTTP request and then used to access a file. In this case, a malicious response could include a file name that is an absolute path, such as `"/Applications/(current_application)/Documents/sensitive.data"`.

In the second bad example, it appears that the user is restricted to opening a file within the `"/Library/Caches"` home directory. In this case, a malicious response could contain a file name containing special characters. For example, the string `"../../Documents/sensitive.data"` will result in the code reading the file located at `"/Applications/(current_application)/Library/Caches/../../Documents/sensitive.data"`, which contains users' sensitive data. This file may then be made accessible to an attacker, giving them access to all this data.

In the following (good) example, the path used to access the file system is normalized *before* being checked against a known prefix. This ensures that regardless of the user input, the resulting path is safe.

{% sample src="PathInjectionGood.swift" %}

## References
* OWASP: [Path Traversal](https://owasp.org/www-community/attacks/Path_Traversal).
{% cwe-references %}
