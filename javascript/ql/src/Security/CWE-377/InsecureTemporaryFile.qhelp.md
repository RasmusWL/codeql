Temporary files created in the operating system's temporary directory are by default accessible to other users. In some cases, this can lead to information exposure, or in the worst case, to remote code execution.


## Recommendation
Use a well-tested library like [tmp](https://www.npmjs.com/package/tmp) for creating temporary files. These libraries ensure both that the file is inaccessible to other users and that the file does not already exist.


## Example
The following example creates a temporary file in the operating system's temporary directory.

{% sample src="examples/insecure-temporary-file.js" %}
The file created above is accessible to other users, and there is no guarantee that the file does not already exist.

The below example uses the [tmp](https://www.npmjs.com/package/tmp) library to securely create a temporary file.

{% sample src="examples/secure-temporary-file.js" %}

## References
* Mitre.org: [CWE-377](https://cwe.mitre.org/data/definitions/377.html).
* NPM: [tmp](https://www.npmjs.com/package/tmp).
{% cwe-references %}
