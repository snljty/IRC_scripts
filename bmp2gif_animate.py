#! /usr/bin/env python3

import imageio
import os, sys

ireverse = False # whether reverse the animate
fduration = 0.1 # duration for each frame
for arg in sys.argv[1:]:
    if arg.title() == 'False':
        ireverse = False
    elif arg.title() == 'True':
        ireverse = True
    else:
        try:
            fduration = float(arg)
        except ValueError:
            print('Warning: unknown argument "{:s}", ignored.'.format(arg))

images = list()
filenames = sorted((fn for fn in os.listdir('.') if fn.endswith('.bmp')), reverse = ireverse)
for filename in filenames:
    images.append(imageio.imread(filename))
imageio.mimsave('out.gif', images, duration = fduration, loop = 1)

