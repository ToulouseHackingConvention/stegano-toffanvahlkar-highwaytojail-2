IMG = stegano-toffanvahlkar-allnightlong-2
TEXC = latexmk -lualatex -output-directory=tmp -shell-escape
FLAG = `uuidgen`

flag.pdf: src/flag.tex
	mkdir -p tmp
	sed src/confidential.tex -e "s/<flag>/$(FLAG)/" > tmp/flag.tex
	$(TEXC) tmp/flag.tex

build: flag.pdf
	docker build -t $(IMG) .

export: build
	mkdir -p export
	docker run --rm --entrypoint cat $(IMG) /home/chall/export.tgz > export/export.tgz

clean:
	-docker rmi $(IMG)
	rm -rf export tmp

.PHONY: build export clean
