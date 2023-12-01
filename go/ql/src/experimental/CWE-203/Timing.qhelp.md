Using a non-constant time comparision to compare sensitive information can lead to auth vulnerabilities.


## Recommendation
Use of a constant time comparision function such as `crypto/subtle` package's ` ConstantTimeCompare` function can prevent this vulnerability.


## Example
In the following examples, the code accepts a secret via a HTTP header in variable ` secretHeader` and a secret from the user in the `headerSecret` variable, which are then compared with a system stored secret to perform authentication.

{% sample src="timingBad.go" %}
In the following example, the input provided by the user is compared using the ` ConstantTimeComapre` function. This ensures that timing attacks are not possible in this case.

{% sample src="timingGood.go" %}

## References
* National Vulnerability Database: [ CVE-2022-24912](https://nvd.nist.gov/vuln/detail/CVE-2022-24912).
* Verbose Logging:[ A timing attack in action ](https://verboselogging.com/2012/08/20/a-timing-attack-in-action)
{% cwe-references %}
