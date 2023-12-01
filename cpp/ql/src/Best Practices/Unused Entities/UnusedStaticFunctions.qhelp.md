This rule finds static functions with definitions that are never called or accessed. These unused functions should be removed to increase code readability, reduce object size and avoid misuse.


## Recommendation
Removing these unused static functions will make code more readable. A common pitfall is that code using a static function is guarded by conditional compilation but the static function is not. Notice that this detects directly unused functions and removing a static function may expose more unused functions.


## Example
{% sample src="UnusedStaticFunctions.cpp" %}

## References
* [MSC12-C. Detect and remove code that has no effect](https://wiki.sei.cmu.edu/confluence/display/c/MSC12-C.+Detect+and+remove+code+that+has+no+effect+or+is+never+executed)
{% cwe-references %}
