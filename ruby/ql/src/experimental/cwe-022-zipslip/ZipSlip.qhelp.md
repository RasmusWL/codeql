Extracting files from a malicious zip file, or similar type of archive, is at risk of directory traversal attacks if filenames from the archive are not properly validated.

Tar archives contain archive entries representing each file in the archive. These entries include a file path for the entry, but these file paths are not restricted and may contain unexpected special elements such as the directory traversal element (`..`). If these file paths are used to create a filesystem path, then a file operation may happen in an unexpected location. This can result in sensitive information being revealed or deleted, or an attacker being able to influence behavior by modifying unexpected files.

For example, if a tar archive contains a file entry `..\sneaky-file`, and the tar archive is extracted to the directory `c:\output`, then naively combining the paths would result in an output file path of `c:\output\..\sneaky-file`, which would cause the file to be written to `c:\sneaky-file`.


## Recommendation
Ensure that output paths constructed from tar archive entries are validated to prevent writing files to unexpected locations.

The recommended way of writing an output file from a tar archive entry is to check that `".."` does not occur in the path.


## Example
In this example an archive is extracted without validating file paths. If `archive.tar` contained relative paths (for instance, if it were created by something like `tar -cf archive.tar ../file.txt`) then executing this code could write to locations outside the destination directory.

{% sample src="examples/zip_slip_bad.rb" %}
To fix this vulnerability, we need to check that the path does not contain any `".."` elements in it.

{% sample src="examples/zip_slip_good.rb" %}

## References
* Snyk: [Zip Slip Vulnerability](https://snyk.io/research/zip-slip-vulnerability).
* OWASP: [Path Traversal](https://owasp.org/www-community/attacks/Path_Traversal).
* class [Gem::Package::TarReader](https://docs.ruby-lang.org/en/2.4.0/Gem/Package/TarReader.html).
* class [Zlib::GzipReader](https://ruby-doc.org/stdlib-2.4.0/libdoc/zlib/rdoc/Zlib/GzipReader.html).
* class [Zip::File](https://www.rubydoc.info/github/rubyzip/rubyzip/Zip/File).
{% cwe-references %}
