A file that contains many lines that are similar to other code within the code base is problematic for the same reasons as a file that contains a lot of (exactly) duplicated code.

{% render "DuplicationProblems.inc.qhelp.md" %}


## Recommendation
Refactor similar code snippets by extracting common functionality into methods that can be reused across classes.


## References
* Wikipedia: [Duplicate code](http://en.wikipedia.org/wiki/Duplicate_code).
* M. Fowler, *Refactoring*. Addison-Wesley, 1999.
{% cwe-references %}
