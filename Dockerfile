FROM debian:jessie

ARG WD="/root"

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y g++ libsfml-dev tar gzip gnupg2

ADD src/insert.cpp res/gnupg.tgz res/orig.png tmp/flag.pdf src/export.sh "$WD/"
WORKDIR "$WD"
