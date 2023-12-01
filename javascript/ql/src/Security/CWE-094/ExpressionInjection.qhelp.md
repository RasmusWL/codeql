Using user-controlled input in GitHub Actions may lead to code injection in contexts like *run:* or *script:*.

Code injection in GitHub Actions may allow an attacker to exfiltrate any secrets used in the workflow and the temporary GitHub repository authorization token. The token might have write access to the repository, allowing an attacker to use the token to make changes to the repository.


## Recommendation
The best practice to avoid code injection vulnerabilities in GitHub workflows is to set the untrusted input value of the expression to an intermediate environment variable and then use the environment variable using the native syntax of the shell/script interpreter (that is, not *${{ env.VAR }}*).

It is also recommended to limit the permissions of any tokens used by a workflow such as the GITHUB_TOKEN.


## Example
The following example lets a user inject an arbitrary shell command:

{% sample src="examples/comment_issue_bad.yml" %}
The following example uses an environment variable, but **still allows the injection** because of the use of expression syntax:

{% sample src="examples/comment_issue_bad_env.yml" %}
The following example uses shell syntax to read the environment variable and will prevent the attack:

{% sample src="examples/comment_issue_good.yml" %}

## References
* GitHub Security Lab Research: [Keeping your GitHub Actions and workflows secure: Untrusted input](https://securitylab.github.com/research/github-actions-untrusted-input).
* GitHub Docs: [Security hardening for GitHub Actions](https://docs.github.com/en/actions/security-guides/security-hardening-for-github-actions).
* GitHub Docs: [Permissions for the GITHUB_TOKEN](https://docs.github.com/en/actions/security-guides/automatic-token-authentication#permissions-for-the-github_token).
{% cwe-references %}
