#!/usr/bin/env python

import sys
from PIL import Image

filename = sys.argv[1] if len(sys.argv) == 2 else "wallpaper.png"
img = Image.open(filename).convert('RGB')

MASK = 0x3
X, Y = img.size[0], 23

secret = []
for y in range(Y):
    for x in range(0, X, 3):
        r, _, _ = img.getpixel((x, y))
        secret.append(format(r & MASK, '02b'))
        # secret is a list of 2 bits strings. Ex: ['01', '11', '01', ...]


secret = ["".join(secret[i:i + 4]) for i in range(0, len(secret), 4)]
secret = "".join(chr(int(s, 2)) for s in secret)

print(secret)
