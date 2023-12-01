{% render "ReDoSIntroduction.inc.qhelp.md" %}


## Example
Consider this regular expression:

```javascript

/^_(__|.)+_$/
```
Its sub-expression `"(__|.)+?"` can match the string `"__"` either by the first alternative `"__"` to the left of the `"|"` operator, or by two repetitions of the second alternative `"."` to the right. Thus, a string consisting of an odd number of underscores followed by some other character will cause the regular expression engine to run for an exponential amount of time before rejecting the input.

This problem can be avoided by rewriting the regular expression to remove the ambiguity between the two branches of the alternative inside the repetition:

```javascript

/^_(__|[^_])+_$/
```
{% render "ReDoSReferences.inc.qhelp.md" %}

