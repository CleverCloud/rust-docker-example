
extern crate hyper;

use hyper::server::{Server, Request, Response};
use hyper::uri::RequestUri;
use hyper::header::ContentType;
use hyper::header;

const HELLO_WORLD: &'static [u8; 13] = b"Hello, World!";

fn main() {
    println!("starting hyper...");
    Server::http(|req: Request, mut res: Response| {
      println!("got request");
        match (req.method, req.uri) {
            (hyper::Get, RequestUri::AbsolutePath(ref path)) if path == "/" => {
                res.headers_mut().set(ContentType::plaintext());
                res.headers_mut().set(header::Server("Hyper".to_owned()));

                res.send(HELLO_WORLD).unwrap();
            }
            _ => (),
        };
    }).listen("0.0.0.0:8080").unwrap();
}
