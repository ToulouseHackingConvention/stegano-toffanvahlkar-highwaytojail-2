IMG = stegano-toffanvahlkar-allnightlong-2

build:
	docker build -t $(IMG) .

export: build
	mkdir -p export
	docker run --rm --entrypoint cat $(IMG) /home/chall/export.tgz > export/export.tgz

clean:
	-docker rmi $(IMG)
	rm -rf export

.PHONY: build export clean
