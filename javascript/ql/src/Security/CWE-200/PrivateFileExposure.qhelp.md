Libraries like `express` provide easy methods for serving entire directories of static files from a web server. However, using these can sometimes lead to accidental information exposure. If for example the `node_modules` folder is served, then an attacker can access the `_where` field from a `package.json` file, which gives access to the absolute path of the file.


## Recommendation
Limit which folders of static files are served from a web server.


## Example
In the example below, all the files from the `node_modules` are served. This allows clients to easily access all the files inside that folder, which includes potentially private information inside `package.json` files.

{% sample src="examples/PrivateFileExposure.js" %}
The issue has been fixed below by only serving specific folders within the `node_modules` folder.

{% sample src="examples/PrivateFileExposureFixed.js" %}

## References
* OWASP: [Sensitive Data Exposure](https://www.owasp.org/index.php/Top_10-2017_A3-Sensitive_Data_Exposure).
{% cwe-references %}
