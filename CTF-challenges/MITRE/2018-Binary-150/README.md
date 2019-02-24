# C Semicolon Bug

**Name:** Security as a Service

**Description for Competitors:** We love micro-services. And that's why, from this point forward, we are declaring all applications that `import`, `include`, or `require` anything monolithic! And like all great micro-services it's open source!

**Description for White Cell:** This program reads a randomly generated key from `key` and the flag from `flag`. It  takes user input, "hashes" the input and key, then compares the result. If the results match, the key will be printed. The challenge would be run on a server and would redirect input from a tcp port to stdin. The C source would be made available.

However, in the `doHash` function, there is a semicolon after the for loop and before the opening bracket. This means that the for loop will run without executing the body. The body will then execute after all iterations of the for loop have completed.

This ultimately means that only the last character is actually "hashed". All a player has to do is write a script to brute force the last character of their input. See `solve.py` for a possible solution.

`clang` presents a warning during compilation. This which would make the challenge easier (for competitors who actually compile the program locally). `gcc` does not present this warning.
