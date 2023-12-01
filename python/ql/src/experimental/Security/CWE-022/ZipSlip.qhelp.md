Extracting files from a malicious zip file, or similar type of archive, is at risk of directory traversal attacks if filenames from the archive are not properly validated.

Zip archives contain archive entries representing each file in the archive. These entries include a file path for the entry, but these file paths are not restricted and may contain unexpected special elements such as the directory traversal element (`..`). If these file paths are used to create a filesystem path, then a file operation may happen in an unexpected location. This can result in sensitive information being revealed or deleted, or an attacker being able to influence behavior by modifying unexpected files.

For example, if a Zip archive contains a file entry `..\sneaky-file`, and the Zip archive is extracted to the directory `c:\output`, then naively combining the paths would result in an output file path of `c:\output\..\sneaky-file`, which would cause the file to be written to `c:\sneaky-file`.


## Recommendation
Ensure that output paths constructed from Zip archive entries are validated to prevent writing files to unexpected locations.

The recommended way of writing an output file from a Zip archive entry is to call `extract()` or `extractall()`.


## Example
In this example an archive is extracted without validating file paths.

{% sample src="zipslip_bad.py" %}
To fix this vulnerability, we need to call the function `extractall()`.

{% sample src="zipslip_good.py" %}

## References
* Snyk: [Zip Slip Vulnerability](https://snyk.io/research/zip-slip-vulnerability).
{% cwe-references %}
