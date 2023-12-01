The Spring Framework provides several classes for creating remote service exporters. Under the hood, the exporters use various deserialization mechanisms such as `ObjectInputStream` or Hessian. Deserializing untrusted data is easily exploitable and in many cases allows an attacker to execute arbitrary code. If a remote attacker can reach endpoints created by the exporters, it results in remote code execution in the worst case.

Examples of unsafe exporters include: `HttpInvokerServiceExporter`, `SimpleHttpInvokerServiceExporter`, `RmiServiceExporter`, `HessianServiceExporter`.

CVE-2016-1000027 has been assigned to this issue in the Spring Framework. It is regarded as a design limitation, and can be mitigated but not fixed outright.


## Recommendation
Avoid using unsafe service exporters. Instead, use other message formats for API endpoints (for example, JSON), but make sure that the underlying deserialization mechanism is properly configured so that deserialization attacks are not possible. If the vulnerable exporters can not be replaced, consider using global deserialization filters introduced in JEP 290.

