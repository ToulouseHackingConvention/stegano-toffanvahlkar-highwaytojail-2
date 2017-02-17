#!/bin/bash

readonly img="../export/wallpaper.png"

echo "Extract key..."
key=""
while read line; do
    key="$key"$'\n'"$line"
    if [[ "$line" == "-----END PGP PRIVATE KEY BLOCK-----" ]]; then
        break
    fi
done <<< "$(python3 extract.py "$img")"
echo "$key" > key.asc

echo "Decrypt evidence..."
mkdir -p gpg && chmod 700 gpg
gpg --homedir gpg --import key.asc 1> /dev/null 2>&1
gpg --homedir gpg --decrypt evidence > evidences-plain
mkdir mnt && sudo mount evidence-plain mnt
evince mnt/flag.pdf

echo "Clean..."
sudo umount mnt
rm gpg mnt key.asc -r

