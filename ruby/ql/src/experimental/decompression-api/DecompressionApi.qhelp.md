Decompression of user-controlled data without taking proper precaution can result in uncontrolled and massive decompression on the server, resulting in a denial of service.


## Recommendation
When decompressing files supplied by the user, make sure that you're checking the size of the incoming data chunks before writing to an output.


## Example
In this example, the size of the input buffer chunks and total size are checked before each chunk is written to the output.

{% sample src="examples/decompress.rb" %}

## References
{% cwe-references %}
