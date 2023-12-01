When opening a file with the `O_CREAT` or `O_TMPFILE` flag, the `mode` must be supplied. If the `mode` argument is omitted, some arbitrary bytes from the stack will be used as the file mode. This leaks some bits from the stack into the permissions of the file.


## Recommendation
The `mode` must be supplied when `O_CREAT` or `O_TMPFILE` is specified.


## Example
The first example opens a file with the `O_CREAT` flag without supplying the `mode` argument. In this case arbitrary bytes from the stack will be used as `mode` argument. The second example correctly supplies the `mode` argument and creates a file that is user readable and writable.

{% sample src="OpenCallMissingModeArgument.c" %}
