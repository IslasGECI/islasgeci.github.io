FROM ubuntu:latest
RUN apt update && apt install --yes \
    aspell \
    make
