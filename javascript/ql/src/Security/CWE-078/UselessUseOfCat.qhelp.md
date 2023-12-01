Using the unix command `cat` only to read a file is an unnecessarily complex way to achieve something that can be done in a simpler and safer manner using the Node.js `fs.readFile` API.

The use of `cat` for simple file reads leads to code that is unportable, inefficient, complex, and can lead to subtle bugs or even security vulnerabilities.


## Recommendation
Use `fs.readFile` or `fs.readFileSync` to read files from the file system.


## Example
The following example shows code that reads a file using `cat`:

{% sample src="examples/useless-cat.js" %}
The code in the example will break if the input `name` contains special characters (including space). Additionally, it does not work on Windows and if the input is user-controlled, a command injection attack can happen.

The `fs.readFile` API should be used to avoid these potential issues:

{% sample src="examples/useless-cat-fixed.js" %}

## References
* OWASP: [Command Injection](https://www.owasp.org/index.php/Command_Injection).
* Node.js: [File System API](https://nodejs.org/api/fs.html).
* [The Useless Use of Cat Award](http://porkmail.org/era/unix/award.html#cat).
{% cwe-references %}
