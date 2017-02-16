IMG = stegano-toffanvahlkar-highwaytojail-2
TEXC = latexmk -lualatex -output-directory=tmp -shell-escape
FLAG = `uuidgen`

all: export

tmp/flag.pdf: src/flag.tex
	mkdir -p tmp
	sed src/flag.tex -e "s/<flag>/$(FLAG)/" > tmp/flag.tex
	$(TEXC) tmp/flag.tex

build: tmp/flag.pdf
	docker build -t $(IMG) .

export: build
	mkdir -p export
	docker run --rm --privileged -v "$${PWD}/export/:/root/export/" $(IMG) ./export.sh

clean:
	-docker rmi $(IMG)
	rm -rf export tmp

.PHONY: all uild export clean
