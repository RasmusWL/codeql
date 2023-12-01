When formatting strings using `printf`-style format strings, one must ensure that the number of supplied arguments matches the number of arguments referenced by the format string. Additional arguments will be thrown away silently, which may not be the intended behavior, and too few arguments will cause an `IllegalFormatException`.

Format strings are used by the `format` method on the classes `String`, `Formatter`, `Console`, `PrintWriter`, and `PrintStream`. Several of these classes also supply the method alias `printf`. The class `Console` has two additional methods, `readLine` and `readPassword`, that also use format strings.

