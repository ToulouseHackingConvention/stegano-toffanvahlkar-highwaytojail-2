IMG = stegano-toffanvahlkar-highwaytojail-2
TEXC = latexmk -lualatex -output-directory=tmp -shell-escape
FLAG = `uuidgen`

flag.pdf: src/flag.tex
	mkdir -p tmp
	sed src/flag.tex -e "s/<flag>/$(FLAG)/" > tmp/flag.tex
	$(TEXC) tmp/flag.tex

build: flag.pdf
	docker build -t $(IMG) .

export: build
	mkdir -p export
	echo "$${PWD}/export/:/root/export/"
	docker run --rm --privileged -v "$${PWD}/export/:/root/export/" $(IMG) ./export.sh

clean:
	-docker rmi $(IMG)
	rm -rf export tmp

.PHONY: flag.pdf build export clean
