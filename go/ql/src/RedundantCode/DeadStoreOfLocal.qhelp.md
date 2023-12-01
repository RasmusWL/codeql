A value is assigned to a variable, but either it is never read, or its value is always overwritten before being read. This means that the original assignment has no effect, and could indicate a logic error or incomplete code.


## Recommendation
Remove assignments to variables that are immediately overwritten, or use the blank identifier `_` as a placeholder for return values that are never used.


## Example
In the following example, a value is assigned to `a`, but then immediately overwritten, a value is assigned to `b` and never used, and finally, the results of a call to `fmt.Println` are assigned to two temporary variables, which are then immediately overwritten by a call to `function`.

{% sample src="DeadStoreOfLocalBad.go" %}
The result of `calculateValue` is never used, and if `calculateValue` is a side-effect free function, those assignments can be removed. To ignore all the return values of `fmt.Println`, you can simply not assign it to any variables. To ignore only certain return values, use `_`.

{% sample src="DeadStoreOfLocalGood.go" %}

## References
* Wikipedia: [Dead store](http://en.wikipedia.org/wiki/Dead_store).
* The Go Programming Language Specification: [Blank identifier](https://golang.org/ref/spec#Blank_identifier).
{% cwe-references %}
