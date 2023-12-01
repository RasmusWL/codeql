HTML links that open in a new tab or window allow the target page to access the DOM of the origin page using `window.opener` unless link type `noopener` or `noreferrer` is specified. This is a potential security risk.


## Recommendation
Specify the link type by adding an attribute `rel="noopener noreferrer"`.


## Example
In the following example, a JSX element is created that corresponds to an HTML link opening the URL `http://example.com` in a new tab. Since it does not specify a link type, that page will be able to access the DOM of the origin page.

{% sample src="examples/TargetBlank.js" %}
To fix this vulnerability, add a `rel` attribute:

{% sample src="examples/TargetBlankGood.js" %}

## References
* Mathias Bynens: [About rel=noopener](https://mathiasbynens.github.io/rel-noopener/).
* Mozilla Developer Network: [HTML Anchor Element](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a).
{% cwe-references %}
