Interpreting hard-coded data, such as string literals containing hexadecimal numbers, as code or as an import path is typical of malicious backdoor code that has been implanted into an otherwise trusted code base and is trying to hide its true purpose from casual readers or automated scanning tools.


## Recommendation
Examine the code in question carefully to ascertain its provenance and its true purpose. If the code is benign, it should always be possible to rewrite it without relying on dynamically interpreting data as code, improving both clarity and safety.


## Example
As an example of malicious code using this obfuscation technique, consider the following simplified version of a snippet of backdoor code that was discovered in a dependency of the popular `event-stream` npm package:

{% sample src="examples/HardcodedDataInterpretedAsCode.js" %}
While this shows only the first few lines of code, it already looks very suspicious since it takes a hard-coded string literal, hex-decodes it and then uses it as an import path. The only reason to do so is to hide the name of the file being imported.


## References
* OWASP: [Trojan Horse](https://www.owasp.org/index.php/Trojan_Horse).
* The npm Blog: [Details about the event-stream incident](https://blog.npmjs.org/post/180565383195/details-about-the-event-stream-incident).
{% cwe-references %}
