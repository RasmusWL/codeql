If the same operation (for example, `free`, `delete`, `close`) is usually performed on the result of a method call, any instances where it is not performed may be misuses of the API, leading to resource leaks or other problems.


## Recommendation
Ensure that the same operation is performed on the result of *all* calls to a particular method, if appropriate.


## Example
In the following example of good usage, the result of the call to `writer.prepareAppendValue` is assigned to `outValue`, and later `close` is called on `outValue`. Any instances where `close` is *not* called may cause resource leaks.

{% sample src="InconsistentCallOnResult.java" %}
