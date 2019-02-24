#!/usr/bin/env python
"""
Solve crack-zet3 challenge for MITRE STEM CTF 2017
Author: Eugene Kolodenker <eugene@eugenekolo.com>
"""
from z3 import *
import sys

vals = []
sol = Solver()
for i in range(20):
    vals.append(Int(str(i)))
    sol.add(Or(And(vals[i] >= 48, vals[i] <= 57), And(vals[i] >= 65, vals[i] <= 90), And(vals[i] >= 97, vals[i] <= 125)))

sol.add(vals[6]*vals[7]-vals[13]-vals[3]==5040)
sol.add(vals[9]-vals[1]+vals[3]+vals[0]==235)
sol.add(vals[18]+vals[17]-vals[7]+vals[6]*vals[12]==6702)
sol.add(vals[1]-vals[7]-vals[15]==-66)
sol.add(vals[16]+vals[15]+vals[17]==310)
sol.add(vals[16]*vals[11]-vals[9]==8926)
sol.add(vals[13]+vals[7]+vals[12]*vals[5]*vals[9]==482679)
sol.add(vals[18]*vals[11]-vals[17]-vals[5]-vals[10]==6432)
sol.add(vals[17]*vals[5]*vals[8]+vals[5]==503538)
sol.add(vals[17]*vals[16]-vals[8]-vals[16]==14567)
sol.add(vals[7]+vals[3]-vals[9]==87)
sol.add(vals[5]*vals[18]-vals[0]-vals[15]==4986)
sol.add(vals[0]*vals[6]*vals[6]*vals[12]+vals[14]==39886298)
sol.add(vals[8]+vals[14]+vals[19]*vals[18]-vals[3]==11267)
sol.add(vals[4]*vals[11]+vals[18]==5788)
sol.add(vals[13]-vals[8]+vals[6]-vals[15]==-10)
sol.add(vals[9]*vals[19]+vals[9]*vals[3]+vals[18]==25386)
sol.add(vals[1]-vals[11]*vals[14]==-4891)
sol.add(vals[13]+vals[2]-vals[7]==50)
sol.add(vals[18]*vals[0]-vals[7]-vals[1]==6797)

print(sol.check())
m = sol.model()

sys.stdout.write("Key = ")
for d in reversed(m.decls()):
    sys.stdout.write(chr(int(str(m[d]))))
sys.stdout.write('\n')
sys.stdout.flush()
