Code that passes remote user input to an arugment of a call of `Runtime.exec` that executes a scripting executable will allow the user to execute malicious code.


## Recommendation
If possible, use hard-coded string literals to specify the command or script to run, or library to load. Instead of passing the user input directly to the process or library function, examine the user input and then choose among hard-coded string literals.

If the applicable libraries or commands cannot be determined at compile time, then add code to verify that the user input string is safe before using it.


## Example
The following example shows code that takes a shell script that can be changed maliciously by a user, and passes it straight to the array going into `Runtime.exec` without examining it first.

{% sample src="CommandInjectionRuntimeExec.java" %}

## References
* OWASP: [Command Injection](https://www.owasp.org/index.php/Command_Injection).
* SEI CERT Oracle Coding Standard for Java: [IDS07-J. Sanitize untrusted data passed to the Runtime.exec() method](https://wiki.sei.cmu.edu/confluence/display/java/IDS07-J.+Sanitize+untrusted+data+passed+to+the+Runtime.exec()+method).
{% cwe-references %}
