This query finds uses of RSA encryption without secure padding. Using PKCS\#1 v1.5 padding can open up your application to several different attacks resulting in the exposure of the encryption key or the ability to determine plaintext from encrypted messages.


## Recommendation
Use the more secure PKCS\#1 v2 (OAEP) padding.


## References
* Wikipedia. [RSA. Padding Schemes](http://en.wikipedia.org/wiki/RSA_(algorithm)#Padding_schemes).
{% cwe-references %}
