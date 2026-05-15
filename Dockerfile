FROM ubuntu:latest
WORKDIR /workdir
RUN apt update && apt install --yes \
    aspell \
    aspell-en \
    aspell-es \
    make
