# -*- sh -*-
FROM schickling/rust
MAINTAINER Geoffroy Couprie, contact@geoffroycouprie.com

RUN mkdir -p /source/rust-hyper/src
ADD ./Cargo.toml /source/rust-hyper/Cargo.toml
ADD ./src/main.rs /source/rust-hyper/src/main.rs
WORKDIR /source/rust-hyper
RUN cargo run

