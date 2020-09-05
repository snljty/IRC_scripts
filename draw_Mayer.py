#! /usr/bin/env python3
# -*- Coding: UTF-8 -*-

r"""
draw Mayer bond order of each frame.
"""

import os
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.ticker as mtick

ireverse = True # set to True if you want to reverse the data, otherwise set to False

def ReadOneElement(f, i, j, pos = 0):
    numberline = 5
    tmp = [None, None, None, None]
    f.seek(pos)
    # find out how many elements
    ntot = 0
    tmp[0] = len(f.readline().strip().split())
    while len(f.readline().strip().split()) == tmp[0] + 1:
        ntot += 1
    f.seek(pos)
    # read the data
    ngrp = (j - 1) // numberline + 1
    for tmp[1] in range(1, ngrp):
        for tmp[2] in range(ntot + 1): f.readline()
    f.readline()
    for tmp[3] in range(i): l = f.readline()
    return np.float64(l.strip().split()[1 + (j - 1) % numberline])

bndmat_files = [_ for _ in os.listdir() if _.endswith('_bndmat.txt')]
x = 1 + np.arange(len(bndmat_files))
y = list()
labels = list()
with open('Mayer_read_in.txt') as f2:
    for l in f2:
        s = l.strip()
        if not s: break
        y.append(list())
for i in x - 1:
    with open(bndmat_files[i]) as f1:
        f1.readline()
        f1.readline()
        pos = f1.tell()
        with open('Mayer_read_in.txt') as f2:
            for j in range(len(y)):
                s = f2.readline().strip()
                t = s.split()
                (y[j]).append(ReadOneElement(f1, int(t[0]), int(t[1]), pos = pos))
                if not i:
                    labels.append(s[s.find(t[2]):])
for i in range(len(y)):
    if ireverse: y[i].reverse()
y = np.array(y)

total_energy = list()
with open('total_energy.txt') as f:
    for l in f:
        s = l.strip()
        if not s: break
        total_energy.append(float(s))
if ireverse: total_energy.reverse()
total_energy = np.array(total_energy)
total_energy -= total_energy.max()
total_energy *= 2625.5

fig, ax1 = plt.subplots(figsize = (9.6, 4.8))
ax2 = ax1.twinx()
ax2.plot(x, total_energy, 'k.-', label = 'Total energy (relative)')
for i in range(len(labels)):
    ax1.plot(x, y[i], label = labels[i])
ax1.set_ylabel('Mayer bond order')
ax2.set_ylabel('Relative energy (kJ/mol)')
ax1.set_xlabel('Reaction coordinate')
ax1.set_xticks([])
ax1.set_title('Mayer Bond Order with Reaction Coordinate')
fig.legend()
fig.savefig('Mayer Bond Order with Reaction Coordinate.png')
fig.savefig('Mayer Bond Order with Reaction Coordinate.svg')
# plt.show()


