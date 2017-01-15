#!/usr/bin/python3
# -*- coding: UTF-8 -*-

# Load pypng
exec(open('./pypng/bin/activate_this.py').read())

import png
import sys
from array import array

def extract(source_name, output_name, layers, mask, shift):
    "Extract an hidden image from an image and store it to a file."

    (width, height, source, meta) = png.Reader(filename=source_name).asRGBA8()

    line = 0
    layer = -1
    column = -1
    end_reached = False

    byte = array('B')
    for i in range(4):
        byte.append(0)
    i = 0

    plain = array('B')
    for row in source:

        line += 1
        # column = -1
        layer = -1
        pf = 0

        for p in row:

            # Increment the layer counter.
            layer = (layer + 1)%4

            # Select a specific layer.
            if (layers&(2**layer)) == 0 :
                continue

            pf = p&mask

            # Increment the column number.
            column = (column+1)%3

            # Skip some columns.
            if column != 0:
                # print(pf, end='')
                continue

            # print("\033[32m{0}\033[0m".format(pf), end='')

            byte[i] = pf

            if (i == 3):
                # Update stop criteria.
                end_reached = (byte[0] == 3) & (byte[1] == 3) & (byte[2] == 3) & (byte[3] == 3)
                if end_reached:
                    break
                pf = (byte[0] << 6) + (byte[1] << 4) + (byte[2] << 2) + (byte[3] << 0)
                # print(hex(pf), end=' ')
                plain.append(pf)

            i = (i+1) % 4

        # print(";\n")
        if end_reached:
            break

    fout = open(output_name, "wb")
    fout.write(plain)
    fout.close()

# ---------------------- Script beginning -----------------------------

argc = len(sys.argv)
if argc < 2 or argc > 3:
    print("Usage: ", sys.argv[0], "source [destination]")
else:
    extract(sys.argv[1], (sys.argv[2] if (argc == 3) else "result.out"), 2**0, 3, 6)
    # print("Done!")
