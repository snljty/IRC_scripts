#! /usr/bin/env python3

import imageio
import os
import time

# if you want to reverse the animate, change the ireverse from False to True.
ireverse = False

t = time.time()
images = list()
filenames = [fn for fn in os.listdir('.') if fn.endswith('.bmp')]
filenames.sort(reverse = ireverse)
for filename in filenames: images.append(imageio.imread(filename))
imageio.mimsave('out.gif', images, duration = 0.1, loop = 1)
print('Time elapsed: {:.1f} s'.format(time.time() - t))

