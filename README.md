<a href="https://hub.docker.com/r/shahinism/stunnel" alt="Docker Pulls">
 <img src="https://img.shields.io/docker/pulls/shahinism/stunnel"/></a>

<a href="https://hub.docker.com/r/shahinism/stunnel" alt="Docker Cloud Build">
 <img src="https://img.shields.io/docker/cloud/build/shahinism/stunnel"/></a>

# Docker Stunnel

[Stunnel](https://www.stunnel.org/) packaged as a docker container. This
container will act as a proxy to encrypt the connection between a client and the
server using TLS.

## Security Measures
- [x] SSLv2 is disabled.
- [x] SSLv3 is disabled.
- [x] TLSv1 is disabled.
- [x] TLSv1.1 is disabled. 
- [x] Limit tls ciphers for openvpn, nginx, stunnel.

## Usage
### Docker Compose

```yml
stunnel:
  image: shahinism/stunnel
  ports:
    - "993:4911"
  links:
    - openvpn
  environment:
    - CLIENT=no
    - SERVICE=openvpn
    - ACCEPT=0.0.0.0:4911
    - CONNECT=openvpn:1194
  restart: always
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to
discuss what you would like to change.

Please make sure to update the tests as appropriate.

## License

This project is licensed under the GPLv3 License - see the
[LICENSE.md](LICENSE.md) file for details
