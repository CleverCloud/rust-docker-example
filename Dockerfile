FROM rust:latest

ADD . /source
WORKDIR /source

EXPOSE 8080
RUN rustc -V

RUN cargo build --release
CMD cargo run --release
