#!/usr/bin/env python2
"""Python Jail Escape Challenge for MITRE STEM CTF 2017
Author: Eugene Kolodenker <eugene@eugenekolo.com>
"""

import resource

rsrc = resource.RLIMIT_DATA
soft, hard = resource.getrlimit(rsrc)
resource.setrlimit(rsrc, (5001200, hard))

del resource

from sys import modules
# no modules pls
modules.clear()
del modules
__builtins__.dir = None

inp = raw_input()

# double underscores, spooky characters, and the word flag scare me pls
if '__' in inp:
    from sys import exit
    print('no!')
    exit()

if 'flag' in inp:
    from sys import exit
    print('no!')
    exit()

for c in inp:
    if c not in "abcdefghijklmnopqrstuvwxyz0123456789[]()":
        from sys import exit
        print('no!')
        exit()

# no fun pls
eval = None
execfile = None
input = None

exec("inp="+inp)

__flag = open('./flag', 'r').read()

if __flag != inp:
    from sys import exit
    print("Nah")
    exit()

print("Flag:"+open('./flag','r').read())
