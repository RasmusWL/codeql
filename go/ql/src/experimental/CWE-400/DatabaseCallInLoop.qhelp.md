Database calls in loops are slower than running a single query and consume more resources. This can lead to denial of service attacks if the loop bounds can be controlled by an attacker.


## Recommendation
Ensure that where possible, database queries are not run in a loop, instead running a single query to get all relevant data.


## Example
In the example below, users in a database are queried one by one in a loop:

{% sample src="DatabaseCallInLoop.go" %}
This is corrected by running a single query that selects all of the users at once:

{% sample src="DatabaseCallInLoopGood.go" %}

## References
{% cwe-references %}
