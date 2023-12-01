Ignoring a method's return value can be a security risk and a common source of defects. If an attacker can force the method to fail, the subsequent program logic could lead to a vulnerability because the program will be running in an unexpected state. This rule checks that the return value of standard library methods like `System.IO.Stream.Read(...)` is always used. Furthermore, it identifies any calls to methods that ignore the return value despite it being frequently used elsewhere. That is, if more than 90% of the total calls to a particular method use its return value, all other calls that discard its return value are flagged as suspicious.


## Recommendation
Check the return value of the method and take appropriate action.


## Example
In the method `IgnoreOne`, there are lots of calls to `DoPrint` where the return value is checked. However, the return value of `DoPrint("J")` is not checked.

In the method `IgnoreRead`, the result of the call to `FileStream.Read` is ignored. This is dangerous, as the amount of data read might be less than the length of the array it is being read into.

{% sample src="UncheckedReturnValueBad.cs" %}

## References
{% cwe-references %}
