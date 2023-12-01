JSDoc comments for functions and constructors should use the `@param` tag to describe the available parameters. Wrong or outdated parameter names in `@param` tags make the documentation difficult to read, and may indicate badly maintained code.


## Recommendation
The parameter names should be corrected. If the documented parameter was removed, its corresponding `@param` tag should also be removed.


## Example
In the following example, the constructor `Message` has a JSDoc comment containing two `@param` tags, one documenting the parameter `title`, and one documenting a non-existent parameter `text`.

{% sample src="examples/JSDocForNonExistentParameter.js" %}
Assuming that `text` was the previous name of the parameter `body`, the second `@param` should be updated to refer to the parameter `body` instead.


## References
* Use JSDoc: [The @param tag](http://usejsdoc.org/tags-param.html).
{% cwe-references %}
