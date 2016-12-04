FROM debian:jessie

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y g++ libsfml-dev tar gzip gnupg2 && \
    useradd -m chall

ADD src/ /home/chall/
ADD res/gnupg.tgz /home/chall/
ADD res/orig.png /home/chall/
ADD flag.txt /home/chall/
WORKDIR /home/chall/

RUN chown chall:chall -R /home/chall/.gnupg

USER chall
RUN gpg2 --output flag.gpg --encrypt --recipient dash flag.txt && \
    gpg2 --output secret.txt --export-secret-key --armor && \
    g++ -O3 -std=c++14 -lsfml-graphics insert.cpp -o hide && \
    ./hide orig.png secret.txt wallpaper.png && \
    tar czvf "export.tgz" hide wallpaper.png flag.gpg

