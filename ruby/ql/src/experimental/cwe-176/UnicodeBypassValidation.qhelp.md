Security checks bypass due to a Unicode transformation

If ever a unicode tranformation is performed after some security checks or logical validation, the latter could be bypassed due to a potential Unicode characters collision. The validation of concern are any character escaping, any regex validation or any string verification.


## Recommendation
Perform a Unicode normalization before the logical validation.


## Example
The following example showcases the bypass of all checks performed by ` html_escape()` due to a post-unicode normalization.

For instance: the character U+FE64 (`﹤`) is not filtered-out by the html_escape() function. But due to the Unicode normalization, the character is transformed and would become U+003C (` < ` ).

{% sample src="./examples/unicode_normalization.rb" %}

## Example
The next example shows how an early deletion of a character may be bypassed due to a potential Unicode character collision.

The character `<` was expected to be omitted from the string `s`. However, a malicious user may consider using its colliding Unicode character U+FE64 ` ﹤` as an alternative. Due to the Late-Unicode normalization with the form NFKC, the resulting string would contain the unintended character `<` .

{% sample src="./examples/unicode_normalization2.rb" %}

## References
* Research study: [ Unicode vulnerabilities that could bYte you ](https://gosecure.github.io/presentations/2021-02-unicode-owasp-toronto/philippe_arteau_owasp_unicode_v4.pdf)
* [Unicode pentest cheatsheet](https://gosecure.github.io/unicode-pentester-cheatsheet/).
{% cwe-references %}
