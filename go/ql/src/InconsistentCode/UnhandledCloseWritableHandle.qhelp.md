Data written to a file handle may not immediately be flushed to the underlying storage medium by the operating system. Often, the data may be cached in memory until the handle is closed, or until a later point after that. Only calling `os.File.Sync` gives a reasonable guarantee that the data is flushed. Therefore, write errors may not occur until `os.File.Close` or `os.File.Sync` are called. If either is called and any errors returned by them are discarded, then the program may be unaware that data loss occurred.


## Recommendation
Always check whether `os.File.Close` returned an error and handle it appropriately.


## Example
In this first example, two calls to `os.File.Close` are made with the intention of closing the file after all work on it has been done or if writing to it fails. However, while errors that may arise during the call to `os.File.WriteString` are handled, any errors arising from the calls to `os.File.Close` are discarded silently:

{% sample src="UnhandledCloseWritableHandleNotDeferred.go" %}
In the second example, a call to `os.File.Close` is deferred in order to accomplish the same behaviour as in the first example. However, while errors that may arise during the call to `os.File.WriteString` are handled, any errors arising from `os.File.Close` are again discarded silently:

{% sample src="UnhandledCloseWritableHandle.go" %}
To correct this issue, handle errors arising from calls to `os.File.Close` explicitly:

{% sample src="UnhandledCloseWritableHandleGood.go" %}

## References
* The Go Programming Language Specification: [Defer statements](https://go.dev/ref/spec#Defer_statements).
* The Go Programming Language Specification: [Errors](https://go.dev/ref/spec#Errors).
{% cwe-references %}
