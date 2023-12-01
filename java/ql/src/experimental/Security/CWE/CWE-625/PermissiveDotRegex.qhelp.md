By default, a "dot" (`.`) in a regular expression matches all characters except the newline characters `\n` and `\r`. Regular expressions containing a dot can be bypassed with the characters `\r`(`%0a`) and `\n`(`%0d`) when the default Java regular expression matching implementations are used. This becomes a security issue if these regular expressions are used to decide whether to grant access to protected application resources.


## Recommendation
To guard against unauthorized access, it is advisable to properly specify regex patterns for validating user input. The Java Pattern Matcher API `Pattern.compile(PATTERN, Pattern.DOTALL)` with the `DOTALL` flag set can be adopted to address this vulnerability.


## Example
The following snippets show a vulnerable example and a secure example respectively. The `bad` methods show a regex pattern allowing a bypass by using line break characters. In the `good` methods, it is shown how to solve this problem by either specifying the regex pattern correctly or using a Java API that properly matches new line characters.

{% sample src="DotRegex.java" %}

## References
* Apache Shiro: [Address the RegexRequestMatcher issue in 1.9.1](https://github.com/apache/shiro/commit/6bcb92e06fa588b9c7790dd01bc02135d58d3f5b).
* CVE-2022-32532: [Applications using RegExPatternMatcher with "." in the regular expression are possibly vulnerable to an authorization bypass](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-32532).
{% cwe-references %}
