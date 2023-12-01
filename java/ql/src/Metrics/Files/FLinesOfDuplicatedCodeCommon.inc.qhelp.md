This metric measures the number of lines in a file that are contained within a block that is duplicated elsewhere. These lines may include code, comments and whitespace, and the duplicate block may be in this file or in another file.

A file that contains many lines that are duplicated within the code base is problematic for a number of reasons.

{% render "DuplicationProblems.inc.qhelp.md" %}


## Recommendation
Refactor files with lots of duplicated code to extract the common code into a shared library or module.


## References
* Wikipedia: [Duplicate code](http://en.wikipedia.org/wiki/Duplicate_code).
* M. Fowler, *Refactoring*. Addison-Wesley, 1999.
{% cwe-references %}
