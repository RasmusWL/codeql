The `ZipOutputStream` class is used to write ZIP files to a file or other stream. A ZIP file consists of a number of *entries*. Usually each entry corresponds to a file in the directory structure being zipped. There is a method on `ZipOutputStream` that is slightly confusingly named `putNextEntry`. Despite its name, it does not write a whole entry. Instead, it writes the *metadata* for an entry. The content for that entry is then written using the `write` method. Finally the entry is closed using `closeEntry`.

Therefore, if you call `putNextEntry` and `closeEntry` but omit the call to `write`, an empty ZIP file entry is written to the output stream.


## Recommendation
Ensure that you include a call to `ZipOutputStream.write`.


## Example
In the following example, the `archive` method calls `putNextEntry` and `closeEntry` but the call to `write` is left out.

{% sample src="CreatesEmptyZip.java" %}

## References
* Java API Specification: [ ZipOutputStream](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/zip/ZipOutputStream.html).
{% cwe-references %}
