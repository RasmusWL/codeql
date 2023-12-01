XSLT (Extensible Stylesheet Language Transformations) is a language for transforming XML documents into other XML documents or other formats. Processing unvalidated XSLT stylesheets can allow attackers to read arbitrary files from the filesystem or to execute arbitrary code.


## Recommendation
The general recommendation is to not process untrusted XSLT stylesheets. If user-provided stylesheets must be processed, enable the secure processing mode.


## Example
In the following examples, the code accepts an XSLT stylesheet from the user and processes it.

In the first example, the user-provided XSLT stylesheet is parsed and processed.

In the second example, secure processing mode is enabled.

{% sample src="XsltInjection.java" %}

## References
* Wikipedia: [XSLT](https://en.wikipedia.org/wiki/XSLT).
* The Java Tutorials: [Transforming XML Data with XSLT](https://docs.oracle.com/javase/tutorial/jaxp/xslt/transformingXML.html).
* [XSLT Injection Basics](https://blog.hunniccyber.com/ektron-cms-remote-code-execution-xslt-transform-injection-java/).
{% cwe-references %}
