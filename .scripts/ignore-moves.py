#!/usr/bin/python

import sys
from itertools import *

RED = 31
GREEN = 32

RESET_SEQ = "\033[0m"
COLOR_SEQ = "\033[0;%dm"

lines = []
indices = []

i = 0
for line in sys.stdin.readlines():
    lines.append(line)
    if line.startswith('+++'):
      indices.append(i)
    i = i + 1

# add the last index line to our lookup table
indices.append(i)

#Look at each section in our diff to determine line that have moved
for i in range(len(indices)-1):
    lineNum1 = indices[i]
    lineNum2 = indices[i+1]
    for j in range(lineNum1, lineNum2):
        line1 = lines[j]
        if line1.startswith('-'):
            for k in range(lineNum1, lineNum2):
                line2 = lines[k]
                if line2.startswith('+'):
                    if line1[1:] == line2[1:]:
                        lines[j] = '=' + line1[1:]
                        lines[k] = '=' + line2[1:]

for line in lines:
    print line.rstrip()
