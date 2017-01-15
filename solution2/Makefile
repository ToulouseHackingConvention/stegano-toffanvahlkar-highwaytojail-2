all: extract decrypt show

extract: key.asc

decrypt: flag.txt

show: flag.txt
	cat flag.txt

# Get the exported files.
wallpaper.png:
	tar -xvzf ../export/export.tgz wallpaper.png
flag.gpg:
	tar -xvzf ../export/export.tgz flag.gpg

# Make a virtual environment in which we install dependencies.
pypng: pypng.sh
	./pypng.sh

# Extract the key from the image.
key.asc: pypng wallpaper.png
	python stegano.py wallpaper.png key.asc

gpg: key.asc
	mkdir -p gpg
	chmod 700 gpg
	gpg2 --homedir gpg --import key.asc 1> /dev/null 2>&1

flag.txt: gpg flag.gpg
	gpg2 --homedir gpg --decrypt flag.gpg > flag.txt

clean:
	rm -f wallpaper.png
	rm -f flag.gpg
	rm -f key.asc
	rm -f flag.txt

clean-all: clean
	rm -rf pypng
	rm -rf gpg

.PHONY: all extract decrypt show clean clean-all
