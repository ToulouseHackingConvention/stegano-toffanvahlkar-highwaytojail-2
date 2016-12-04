IMG = stegano-toffanvahlkar-allnightlong-2

image:
	docker build -t $(IMG) .

build: image

export:
	mkdir -p export
	docker run --rm --entrypoint cat $(IMG) /home/chall/export.tgz > export/export.tgz

clean:
	rm -rf export

clean-all:
	-docker rmi $(IMG)

.PHONY: image build export clean clean-all
