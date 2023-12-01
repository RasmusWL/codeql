Processing an unvalidated user input can allow an attacker to inject arbitrary command in your local and remote servers when creating a ssh connection.


## Recommendation
This vulnerability can be prevented by not allowing untrusted user input to be passed as ProxyCommand or exec_command.


## Example
In the example below, the ProxyCommand and exec_command are controlled by the user and hence leads to a vulnerability.

{% sample src="paramikoBad.py" %}
