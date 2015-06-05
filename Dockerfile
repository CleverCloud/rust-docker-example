# -*- sh -*-
FROM base/archlinux
MAINTAINER Geoffroy Couprie, contact@geoffroycouprie.com

RUN echo -e "[multilib]\nInclude = /etc/pacman.d/mirrorlist" > /tmp/multilib
RUN cat /etc/pacman.conf /tmp/multilib > /tmp/pacman.conf
RUN mv /tmp/pacman.conf /etc/pacman.conf
RUN pacman -Syu --noconfirm
#CMD bash
RUN pacman -S --noconfirm curl unzip lib32-zlib lib32-ncurses lib32-bzip2 lib32-libstdc++5 lib32-gcc-libs lib32-openssl

RUN curl -sSf https://static.rust-lang.org/rustup.sh | sh -s -- --channel=nightly

RUN mkdir -p /source/rust-hyper/src
ADD ./Cargo.toml /source/rust-hyper/Cargo.toml
ADD ./src/main.rs /source/rust-hyper/src/main.rs
WORKDIR /source/rust-hyper
RUN rustc -V
RUN cargo run

