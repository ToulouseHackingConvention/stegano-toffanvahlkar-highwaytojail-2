FROM debian:jessie

ARG WD="/home/chall"

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y g++ libsfml-dev tar gzip gnupg2 && \
    useradd -m chall

ADD src/ res/gnupg.tgz res/orig.png src/flag.txt "$WD/"
WORKDIR "$WD"

RUN chown chall:chall -R "${WD}/.gnupg"

USER chall
RUN gpg2 --output flag.gpg --encrypt --recipient dash flag.txt && \
    gpg2 --output secret.txt --export-secret-key --armor && \
    g++ -O3 -std=c++14 -lsfml-graphics insert.cpp -o hide && \
    ./hide orig.png secret.txt wallpaper.png && \
    tar czvf "export.tgz" hide wallpaper.png flag.gpg
