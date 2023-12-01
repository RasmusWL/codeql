Processing user-controlled data with a method that allocates excessive amounts of memory can lead to denial of service.

If the JSON schema validation library `ajv` is configured with `allErrors: true` there is no limit to how many error objects will be allocated. An attacker can exploit this by sending an object that deliberately contains a huge number of errors, and in some cases, with longer and longer error messages. This can cause the service to become unresponsive due to the slow error-checking process.


## Recommendation
Do not use `allErrors: true` in production.


## Example
In the example below, the user-submitted object `req.body` is validated using `ajv` and `allErrors: true`:

{% sample src="examples/DeepObjectResourceExhaustion.js" %}
Although this ensures that `req.body` conforms to the schema, the validation itself could be vulnerable to a denial-of-service attack. An attacker could send an object containing so many errors that the server runs out of memory.

A solution is to not pass in `allErrors: true`, which means `ajv` will only report the first error, not all of them:

{% sample src="examples/DeepObjectResourceExhaustion_fixed.js" %}

## References
* Ajv documentation: [security considerations](https://github.com/ajv-validator/ajv/blob/master/docs/security.md#untrusted-schemas)
{% cwe-references %}
