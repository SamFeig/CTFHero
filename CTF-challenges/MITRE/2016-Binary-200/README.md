# DankLang

In this challenge, competitors are provided with the included file `dank.asm` which contains multiple instructions written in DankLang.

## Solution

Competitors will have to create a script to convert the dank.asm code into regular MIPS assembly and then use a program such as QTSpim to run the resulting code with the key.

Steps:

1. Get the proper input to the script from dank.asm (The input can be found in dank.asm next to "Muh flag iz rustled:")
2. Run `python converter.py`
3. Open QTSpim.
4. Load the dank_asm_stripped_output.asm that converter.py output into QTSpim.
5. Click the Run arrow and then when asked for a flag, input the text found in step 1.
6. The output should be the key


## To Distribute

    dist/dank.asm

## Flag

The proper flag is `mca-aecbbadd`