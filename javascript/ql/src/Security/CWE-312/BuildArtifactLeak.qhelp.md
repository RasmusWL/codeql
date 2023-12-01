Sensitive information included in a build artifact can allow an attacker to access the sensitive information if the artifact is published.


## Recommendation
Only store information that is meant to be publicly available in a build artifact.


## Example
The following example creates a `webpack` configuration that inserts all environment variables from the host into the build artifact:

{% sample src="examples/build-leak.js" %}
The environment variables might include API keys or other sensitive information, and the build-system should instead insert only the environment variables that are supposed to be public.

The issue has been fixed below, where only the `DEBUG` environment variable is inserted into the artifact.

{% sample src="examples/build-leak-fixed.js" %}

## References
* webpack: [DefinePlugin API](https://webpack.js.org/plugins/define-plugin/).
{% cwe-references %}
