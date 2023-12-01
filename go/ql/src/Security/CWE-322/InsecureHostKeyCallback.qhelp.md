The `ClientConfig` specifying the configuration for establishing a SSH connection has a field `HostKeyCallback` that must be initialized with a function that validates the host key returned by the server.

Not properly verifying the host key returned by a server provides attackers with an opportunity to perform a Machine-in-the-Middle (MitM) attack. A successful attack can compromise the confidentiality and integrity of the information communicated with the server.

The `ssh` package provides the predefined callback `InsecureIgnoreHostKey` that can be used during development and testing. It accepts any provided host key. This callback, or a semantically similar callback, should not be used in production code.


## Recommendation
The `HostKeyCallback` field of `ClientConfig` should be initialized with a function that validates a host key against an allow list. If a key is not on a predefined allow list, the connection must be terminated and the failed security operation should be logged.

When the allow list contains only a single host key then the function `FixedHostKey` can be used.


## Example
The following example shows the use of `InsecureIgnoreHostKey` and an insecure host key callback implementation commonly used in non-production code.

{% sample src="InsecureHostKeyCallbackExample.go" %}
The next example shows a secure implementation using the `FixedHostKey` that implements an allow-list.

{% sample src="SecureHostKeyCallbackExample.go" %}

## References
* Go Dev: [package ssh](https://pkg.go.dev/golang.org/x/crypto/ssh?tab=doc).
{% cwe-references %}
