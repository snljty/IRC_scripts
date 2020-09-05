#! /usr/bin/env python3
# -*- Coding: UTF-8 -*-

import os

filelist = [_ for _ in os.listdir() if _.endswith('.out')]
with open('total_energy.txt', 'w') as ofl:
    for i in filelist:
        with open(i) as ifl:
            for l in ifl:
                if 'SCF Done' in l:
                    print('%16.9lf' % float(l.strip().split()[4]), file = ofl)
                    break

