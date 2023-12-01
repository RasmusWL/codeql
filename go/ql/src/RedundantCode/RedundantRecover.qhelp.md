The built-in `recover` function is only useful inside deferred functions. Calling it in a function that is never deferred means that it will always return `nil` and it will never regain control of a panicking goroutine. The same is true of calling `recover` directly in a defer statement.


## Recommendation
Carefully inspect the code to determine whether it is a mistake that should be fixed.


## Example
In the example below, the function `fun1` is intended to recover from the panic. However, the function that is deferred calls another function, which then calls `recover`:

{% sample src="RedundantRecover1.go" %}
This problem can be fixed by deferring the call to the function which calls `recover`:

{% sample src="RedundantRecover1Good.go" %}
In the following example, `recover` is called directly in a defer statement, which has no effect, so the panic is not caught.

{% sample src="RedundantRecover2.go" %}
We can fix this by instead deferring an anonymous function which calls `recover`.

{% sample src="RedundantRecover2Good.go" %}

## References
* [Defer, Panic, and Recover - The Go Blog](https://blog.golang.org/defer-panic-and-recover).
{% cwe-references %}
