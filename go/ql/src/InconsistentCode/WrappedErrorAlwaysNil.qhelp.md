The `pkg.errors` package provides the `errors.Wrap` function for annotating an error with a stack trace. When passed `nil`, this function returns `nil`. When the first parameter to `errors.Wrap` is *always* `nil`, the function call has no effect and likely indicates a programming mistake. A common example of this is when an `errors.Wrap(err, "message")` call is copied from an earlier error-handling block in the same function and used in a subsequent error-handling block that does not check `err` in its guard. In this case the return of a `nil` value to the caller indicates by convention that the operation succeeded, and so the failure is masked.


## Recommendation
Usually an `err` value is being referenced outside its intended scope. The problem can be fixed by removing that reference, for example by changing a call of the form `errors.Wrap(err, "message")` to `errors.New("message")`.


## Example
The example below shows an example where the `err` value returned from the call to `f1` is reused in a later call, when it is known to be `nil`:

{% sample src="WrappedErrorAlwaysNil.go" %}
One way of fixing this is to create a new error value with `errors.New`:

{% sample src="WrappedErrorAlwaysNilGood.go" %}

## References
* Go errors, github.com/pkg/errors: [errors.Wrap](https://pkg.go.dev/github.com/pkg/errors#Wrap)
{% cwe-references %}
