Nested functions are a useful feature of Python as it allows a function to access the variables of its enclosing function. However, the programmer needs to be aware that when an inner function accesses a variable in an outer scope, it is the variable that is captured, not the value of that variable.

Therefore, care must be taken when the captured variable is a loop variable, since it is the loop *variable* and *not* the *value* of that variable that is captured. This will mean that by the time that the inner function executes, the loop variable will have its final value, not the value when the inner function was created.


## Recommendation
The simplest way to fix this problem is to add a local variable of the same name as the outer variable and initialize that using the outer variable as a default. ` for var in seq: ... def inner_func(arg): ... use(var) ` becomes ` for var in seq: ... def inner_func(arg, var=var): ... use(var) `


## Example
In this example, a list of functions is created which should each increment its argument by its index in the list. However, since `i` will be 9 when the functions execute, they will each increment their argument by 9.

{% sample src="LoopVariableCapture.py" %}
This can be fixed by adding the default value as shown below. The default value is computed when the function is created, so the desired effect is achieved.

{% sample src="LoopVariableCapture2.py" %}

## References
* The Hitchhiker’s Guide to Python: [Late Binding Closures](http://docs.python-guide.org/en/latest/writing/gotchas/#late-binding-closures)
* Python Language Reference: [Naming and binding](https://docs.python.org/reference/executionmodel.html#naming-and-binding)
{% cwe-references %}
