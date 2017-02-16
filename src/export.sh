#!/bin/bash

echo "Create volume..."
dd if=/dev/zero of=volume bs=1M count=20
mkfs.ext4 volume && mount volume /mnt
cp flag.pdf /mnt/
sync && umount /mnt

echo "Encrypt volume..."
gpg2 --output evidences --encrypt --recipient Severus volume

echo "Hide key..."
gpg2 --output secret.txt --export-secret-key --armor
g++ -O3 -std=c++14 -lsfml-graphics insert.cpp -o hide
./hide orig.png secret.txt wallpaper.png

echo "Collect exports..."
mv hide wallpaper.png evidences export/
