# -*- sh -*-
FROM geal/archlinux-rust
MAINTAINER Geoffroy Couprie, contact@geoffroycouprie.com


RUN curl -sSf https://static.rust-lang.org/rustup.sh | sh -s -- --channel=nightly --disable-sudo -y

RUN export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

RUN mkdir -p /source/rust-hyper/src
ADD ./Cargo.toml /source/rust-hyper/Cargo.toml
ADD ./src/main.rs /source/rust-hyper/src/main.rs
WORKDIR /source/rust-hyper
RUN LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib rustc -V
CMD LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib cargo run

