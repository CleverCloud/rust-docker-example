# -*- sh -*-
FROM geal/archlinux-rust
MAINTAINER Geoffroy Couprie, contact@geoffroycouprie.com

ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

ADD . /source
WORKDIR /source

EXPOSE 8080
RUN rustc -V
RUN cargo build
CMD cargo run
