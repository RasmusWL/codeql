Some regular expressions take a long time to match certain input strings to the point where the time it takes to match a string of length *n* is proportional to *n<sup>k</sup>* or even *2<sup>n</sup>*. Such regular expressions can negatively affect performance, or even allow a malicious user to perform a Denial of Service ("DoS") attack by crafting an expensive input string for the regular expression to match.

The regular expression engine provided by Python uses a backtracking non-deterministic finite automata to implement regular expression matching. While this approach is space-efficient and allows supporting advanced features like capture groups, it is not time-efficient in general. The worst-case time complexity of such an automaton can be polynomial or even exponential, meaning that for strings of a certain shape, increasing the input length by ten characters may make the automaton about 1000 times slower.

Typically, a regular expression is affected by this problem if it contains a repetition of the form `r*` or `r+` where the sub-expression `r` is ambiguous in the sense that it can match some string in multiple ways. More information about the precise circumstances can be found in the references.


## Recommendation
Modify the regular expression to remove the ambiguity, or ensure that the strings matched with the regular expression are short enough that the time-complexity does not matter.

