The APIs provided by the .NET libraries for XML manipulation allow the insertion of "raw" text at a specified point in an XML document. If user input is passed to this API, it could allow a malicious user to add extra content that could corrupt or supersede existing content, or enable unintended additional functionality.


## Recommendation
Avoid using the `WriteRaw` method on `System.Xml.XmlWriter` with user input. If possible, use the high-level APIs to write new XML elements to a document, as these automatically escape user content. If that is not possible, then user input should be escaped before being included in a string that will be used with the `WriteRaw` API.


## Example
In this example, user input is provided describing the name of an employee to add to an XML document representing a set of names. The `WriteRaw` API is used to write the new employee record to the XML file.

{% sample src="XMLInjectionBad.cs" %}
However, if a malicious user were to provide the content `Bobby Pages</name></employee><employee><name>Hacker1`, they would be able to add an extra entry into the XML file.

The corrected version demonstrates two ways to avoid this issue. The first is to escape user input before passing it to the `WriteRaw` API, which prevents a malicious user from closing or opening XML tags. The second approach uses the high level XML API to add XML elements, which ensures the content is appropriately escaped.

{% sample src="XMLInjectionGood.cs" %}

## References
* Web Application Security Consortium: [XML Injection](http://projects.webappsec.org/w/page/13247004/XML%20Injection).
* Microsoft Docs: [WriteRaw](https://docs.microsoft.com/en-us/dotnet/api/system.xml.xmlwriter.writeraw?view=netframework-4.8).
{% cwe-references %}
