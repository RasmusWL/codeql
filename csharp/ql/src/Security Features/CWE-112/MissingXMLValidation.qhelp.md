If unsanitized user input is processed as XML, it should be validated against a known schema. If no validation occurs, or if the validation relies on the schema or DTD specified in the document itself, then the XML document may contain any data in any form, which may invalidate assumptions the program later makes.


## Recommendation
All XML provided by a user should be validated against a known schema when it is processed.

If using `XmlReader.Create`, you should always pass an instance of `XmlReaderSettings`, with the following properties:

* `ValidationType` must be set to `Schema`. If this property is unset, no validation occurs. If it is set to `DTD`, the document is only validated against the DTD specified in the user-provided document itself - which could be specified as anything by a malicious user.
* `ValidationFlags` must not include `ProcessInlineSchema` or `ProcessSchemaLocation`. These flags allow a user to provide their own inline schema or schema location for validation, allowing a malicious user to bypass the known schema validation.

## Example
In the following example, text provided by a user is loaded using `XmlReader.Create`. In the first three examples, insufficient validation occurs, because either no validation is specified, or validation is only specified against a DTD provided by the user, or the validation permits a user to provide an inline schema. In the final example, a known schema is provided, and validation is set, using an instance of `XmlReaderSettings`. This ensures that the user input is properly validated against the known schema.

{% sample src="MissingXMLValidation.cs" %}

## References
* Microsoft: [XML Schema (XSD) Validation with XmlSchemaSet](https://msdn.microsoft.com/en-us/library/3740e0b5(v=vs.110).aspx).
{% cwe-references %}
