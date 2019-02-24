contents = str(open('dank_asm_stripped', 'r').read())

contents = contents.replace("d00t ", ".")
contents = contents.replace("> be ", "")
contents = contents.replace("earth", "globl")
contents = contents.replace("> Just", "j")
contents = contents.replace("> Be_Not_Easy", "bne")
contents = contents.replace("> All_Dank_Dreams", "add")
contents = contents.replace("_Imagined", "i")
contents = contents.replace("> tfw", "syscall")
contents = contents.replace("> Le_Brave", "lb")

contents = contents.replace("> Xtreme_dORitos", "xor")
contents = contents.replace("> Such_Bravery", "sb")
contents = contents.replace("> Lulz_In", "li")
contents = contents.replace("> Lulz_At", "la")
contents = contents.replace("> Le_Brave", "lb")
contents = contents.replace("> Much_Obfuscation_Very_Excite", "move")

writefile = open('dank_asm_stripped_output.asm', 'w')

writefile.write(contents)