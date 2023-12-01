Turning Apache Struts' development mode configuration on while deploying applications to production environments can lead to remote code execution.


## Recommendation
An application should disable the development mode at the time of deployment.


## Example
The following example shows a \`struts.xml\` file with \`struts.devmode\` enabled.

{% sample src="StrutsBad.xml" %}
This can be easily corrected by setting the value of the \`struts.devmode\` parameter to false.

{% sample src="StrutsGood.xml" %}

## References
* Apache Struts: [Struts development mode configuration](https://struts.apache.org/core-developers/development-mode.html)
{% cwe-references %}
