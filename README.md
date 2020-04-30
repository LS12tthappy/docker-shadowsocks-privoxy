# shadowsocks-privoxy

    forked from bluebu/shadowsocks-privoxy
    
    Migrate to shadowsocks-libev to support more encrypt_method.
    
    HTTP Proxy for Synology & QNAS NAS.

## Docker image:

`` docker pull ls12/shadowsocks-privoxy ``



The container can be run using the following command:

```shell
docker run -d \
    --volume /path/to/privoxy/config:/etc/privoxy/config \ # Privoxy config (optional)
    --publish 8118:8118 \ # To expose the Privoxy port
    --publish 7070:7070 \ # To expose the socks5 port
    --env SERVER_ADDR=your.server \
    --env SERVER_PORT=port \
    --env METHOD=aes-256-gcm \  #(default: aes-256-gcm)
    --env PASSWORD= \
    ls12/shadowsocks-privoxy
```



Or  `` docker-compose.yml ``

```
version: '3.3'
services:
    shadowsocks-privoxy:
        container_name: shadowsocks-privoxy
        ports:
            - '7070:7070'
            - '8118:8118'
        volumes:
            - '/path/to/privoxy/config:/etc/privoxy/config'
        restart: on-failure
        environment:
            - SERVER_ADDR=
            - SERVER_PORT=
            - METHOD=
            - PASSWORD=
        image: ls12/shadowsocks-privoxy
```



## NAS Run:

```
set variables: 
SERVER_ADDR=                  Your server ip/domain
SERVER_PORT=                  Your server port
METHOD=                       <encrypt_method>        
                              Encrypt method: rc4-md5,
                              aes-128-gcm, aes-192-gcm, aes-256-gcm,
                              aes-128-cfb, aes-192-cfb, aes-256-cfb,
                              aes-128-ctr, aes-192-ctr, aes-256-ctr,
                              camellia-128-cfb, camellia-192-cfb,
                              camellia-256-cfb, bf-cfb,
                              chacha20-ietf-poly1305,
                              xchacha20-ietf-poly1305,
                              salsa20, chacha20 and chacha20-ietf.
                              The default cipher is aes-256-gcm.
PASSWORD=                     Your PASSWORD
```
