Empty blocks or blocks with only code that has been commented out should be reviewed. It is common to find commented-out code in an empty block. Commented-out code is discouraged because it is a source of defects and maintainability issues.


## Recommendation
The appropriate solution depends on the exact situation. If the block should be doing something, add an implementation (where possible). If the block is redundant, remove it. Note that some refactoring may then be required: for example, if the "then" branch of an if is empty, it should be removed, and the sense of the condition of the if should be inverted to simplify the code.


## Example
In this example the entire 'then' block of the `if` statement has been commented out. The block should be removed and the sense of the `if` condition inverted.

{% sample src="EmptyBlock.cs" %}
