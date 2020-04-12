FROM alpine:edge
MAINTAINER Shahin Azad <me@5hah.in>

RUN apk add --no-cache stunnel libressl

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

VOLUME /etc/stunnel

ENTRYPOINT ["/entrypoint.sh"]
