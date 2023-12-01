Electron is secure by default through a same-origin policy requiring all JavaScript and CSS code to originate from the machine running the Electron application. Setting the `webSecurity` property of a `webPreferences` object to `false` will disable the same-origin policy.

Disabling the same-origin policy is strongly discouraged.


## Recommendation
Do not disable `webSecurity`.


## Example
The following example shows `webSecurity` being disabled.

{% sample src="examples/DisablingWebSecurity.js" %}
This is problematic, since it allows the execution of insecure code from other domains.


## References
* Electron Documentation: [Security, Native Capabilities, and Your Responsibility](https://electronjs.org/docs/tutorial/security#5-do-not-disable-websecurity)
{% cwe-references %}
