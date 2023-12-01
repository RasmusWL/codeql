AngularJS is secure by default through automated sanitization and filtering of untrusted values that could cause vulnerabilities such as XSS. Strict Contextual Escaping (SCE) is an execution mode in AngularJS that provides this security mechanism.

Disabling SCE in an AngularJS application is strongly discouraged. It is even more discouraged to disable SCE in a library, since it is an application-wide setting.


## Recommendation
Do not disable SCE.


## Example
The following example shows an AngularJS application that disables SCE in order to dynamically construct an HTML fragment, which is later inserted into the DOM through `$scope.html`.

{% sample src="examples/DisablingSce.js" %}
This is problematic, since it disables SCE for the entire AngularJS application.

Instead, just mark the dynamically constructed HTML fragment as safe using `$sce.trustAsHtml`, before assigning it to `$scope.html`:

{% sample src="examples/DisablingSce_better.js" %}
Please note that this example is for illustrative purposes only; use the AngularJS templating system to dynamically construct HTML when possible.


## References
* AngularJS Developer Guide: [Strict Contextual Escaping](https://docs.angularjs.org/api/ng/service/$sce)
* AngularJS Developer Guide: [Can I disable SCE completely?](https://docs.angularjs.org/api/ng/service/$sce#can-i-disable-sce-completely-).
{% cwe-references %}
