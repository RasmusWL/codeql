Combining *pull_request_target* workflow trigger with an explicit checkout of an untrusted pull request is a dangerous practice that may lead to repository compromise.


## Recommendation
The best practice is to handle the potentially untrusted pull request via the *pull_request* trigger so that it is isolated in an unprivileged environment. The workflow processing the pull request should then store any results like code coverage or failed/passed tests in artifacts and exit. The following workflow then starts on *workflow_run* where it is granted write permission to the target repository and access to repository secrets, so that it can download the artifacts and make any necessary modifications to the repository or interact with third party services that require repository secrets (e.g. API tokens).


## Example
The following example allows unauthorized repository modification and secrets exfiltration:

{% sample src="examples/pull_request_target_bad.yml" %}
The following example uses two workflows to handle potentially untrusted pull request in a secure manner. The receive_pr.yml is triggered first:

{% sample src="examples/receive_pr.yml" %}
The comment_pr.yml is triggered after receive_pr.yml completes:

{% sample src="examples/comment_pr.yml" %}

## References
* GitHub Security Lab Research: [Keeping your GitHub Actions and workflows secure: Preventing pwn requests](https://securitylab.github.com/research/github-actions-preventing-pwn-requests).
{% cwe-references %}
