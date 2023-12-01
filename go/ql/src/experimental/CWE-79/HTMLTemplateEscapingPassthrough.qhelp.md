In Go, the `html/template` package has a few special types (`HTML`, `HTMLAttr`, `JS`, `JSStr`, `CSS`, `Srcset`, and `URL`) that allow values to be rendered as-is in the template, avoiding the escaping that all the other strings go through.

Using them on user-provided values will result in an opportunity for XSS.


## Recommendation
Make sure to never use those types on untrusted content.


## Example
In the first example you can see the special types and how they are used in a template:

{% sample src="HTMLTemplateEscapingPassthroughBad.go" %}
To avoid XSS, all user input should be a normal string type.

{% sample src="HTMLTemplateEscapingPassthroughGood.go" %}
