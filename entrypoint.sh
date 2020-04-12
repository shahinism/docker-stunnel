#!/bin/sh
set -e

cd /etc/stunnel || exit 1

cat > stunnel.conf <<_EOF_
cert = /etc/stunnel/stunnel.pem
foreground = yes
setuid = stunnel
setgid = stunnel
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1
options = NO_SSLv2
options = NO_SSLv3
options = NO_TLSv1
options = NO_TLSv1.1
ciphers = ECDHE-RSA-AES256-GCM-SHA384:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-SHA384:ECDHE-RSA-AES128-SHA256
client = ${CLIENT:-no}

[${SERVICE}]
accept = ${ACCEPT}
connect = ${CONNECT}
_EOF_

if ! [ -f stunnel.pem ]
then
    libressl req -x509 -nodes -newkey rsa:2048 -days 3650 -subj '/CN=stunnel' \
                -keyout stunnel.pem -out stunnel.pem
    chmod 600 stunnel.pem
fi

exec stunnel "$@"
