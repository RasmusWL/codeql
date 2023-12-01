[Bintray and JCenter are shutting down on February 1st, 2022](https://jfrog.com/blog/into-the-sunset-bintray-jcenter-gocenter-and-chartcenter/). Relying upon repositories that are deprecated or scheduled to be shutdown can have unintended consequences; for example, artifacts being resolved from a different artifact server or a total failure of the CI build.

When artifact repositories are left unmaintained for a long period of time, vulnerabilities may emerge. Theoretically, this could allow attackers to inject malicious code into the artifacts that you are resolving and infect build artifacts that are being produced. This can be used by attackers to perform a [supply chain attack](https://en.wikipedia.org/wiki/Supply_chain_attack) against your project's users.


## Recommendation
Always use the canonical repository for resolving your dependencies.


## Example
The following example shows locations in a Maven POM file where artifact repository upload/download is configured. The use of Bintray in any of these locations is not advised.

{% sample src="bad-bintray-pom.xml" %}

## References
* JFrog blog: [ Into the Sunset on May 1st: Bintray, JCenter, GoCenter, and ChartCenter ](https://jfrog.com/blog/into-the-sunset-bintray-jcenter-gocenter-and-chartcenter/)
{% cwe-references %}
