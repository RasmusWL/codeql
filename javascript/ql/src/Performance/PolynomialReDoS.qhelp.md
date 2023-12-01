{% render "ReDoSIntroduction.inc.qhelp.md" %}


## Example
Consider this use of a regular expression, which removes all leading and trailing whitespace in a string:

```javascript

text.replace(/^\s+|\s+$/g, ''); // BAD
```
The sub-expression `"\s+$"` will match the whitespace characters in `text` from left to right, but it can start matching anywhere within a whitespace sequence. This is problematic for strings that do **not** end with a whitespace character. Such a string will force the regular expression engine to process each whitespace sequence once per whitespace character in the sequence.

This ultimately means that the time cost of trimming a string is quadratic in the length of the string. So a string like `"a b"` will take milliseconds to process, but a similar string with a million spaces instead of just one will take several minutes.

Avoid this problem by rewriting the regular expression to not contain the ambiguity about when to start matching whitespace sequences. For instance, by using a negative look-behind (`/^\s+|(?<!\s)\s+$/g`), or just by using the built-in trim method (`text.trim()`).

Note that the sub-expression `"^\s+"` is **not** problematic as the `^` anchor restricts when that sub-expression can start matching, and as the regular expression engine matches from left to right.


## Example
As a similar, but slightly subtler problem, consider the regular expression that matches lines with numbers, possibly written using scientific notation:

```javascript

/^0\.\d+E?\d+$/.test(str) // BAD
```
The problem with this regular expression is in the sub-expression `\d+E?\d+` because the second `\d+` can start matching digits anywhere after the first match of the first `\d+` if there is no `E` in the input string.

This is problematic for strings that do **not** end with a digit. Such a string will force the regular expression engine to process each digit sequence once per digit in the sequence, again leading to a quadratic time complexity.

To make the processing faster, the regular expression should be rewritten such that the two `\d+` sub-expressions do not have overlapping matches: `^0\.\d+(E\d+)?$`.


## Example
Sometimes it is unclear how a regular expression can be rewritten to avoid the problem. In such cases, it often suffices to limit the length of the input string. For instance, the following regular expression is used to match numbers, and on some non-number inputs it can have quadratic time complexity:

```javascript

/^(\+|-)?(\d+|(\d*\.\d*))?(E|e)?([-+])?(\d+)?$/.test(str) // BAD
```
It is not immediately obvious how to rewrite this regular expression to avoid the problem. However, you can mitigate performance issues by limiting the length to 1000 characters, which will always finish in a reasonable amount of time.

```javascript

if (str.length > 1000) {
    throw new Error("Input too long");
}

/^(\+|-)?(\d+|(\d*\.\d*))?(E|e)?([-+])?(\d+)?$/.test(str)
```
{% render "ReDoSReferences.inc.qhelp.md" %}

