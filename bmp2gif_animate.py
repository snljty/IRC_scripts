#! /usr/bin/env python3

import imageio
import os

images = list()
filenames = sorted((fn for fn in os.listdir('.') if fn.endswith('.bmp')), reverse = False)
for filename in filenames:
    images.append(imageio.imread(filename))
imageio.mimsave('out.gif', images, duration = 0.1, loop = 1)

