This metric measures the number of lines in a file that are contained within a block that is duplicated elsewhere. These lines may include code, comments and whitespace, and the duplicate block may be in this file or in another file.

A file that contains many lines that are similar to other code within the code base is problematic for the same reasons as a file that contains a lot of (exactly) duplicated code.

{% render "DuplicationProblems.inc.qhelp.md" %}


## Recommendation
Refactor similar code snippets by extracting common functionality into functions that can be reused across modules.


## References
* Wikipedia: [Duplicate code](http://en.wikipedia.org/wiki/Duplicate_code).
* M. Fowler, *Refactoring*. Addison-Wesley, 1999.
{% cwe-references %}
