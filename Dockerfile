FROM shadowsocks/shadowsocks-libev:latest
MAINTAINER bluebu <bluebuwang@gmail.com>

USER root

#------------------------------------------------------------------------------
# Environment variables:
#------------------------------------------------------------------------------

RUN \
  apk --update --upgrade add \
      privoxy \
  && rm /var/cache/apk/*

ENV SERVER_ADDR= \
    SERVER_PORT=8899  \
    METHOD=aes-256-gcm \
    TIMEOUT=300 \
    PASSWORD=

#------------------------------------------------------------------------------
# Populate root file system:
#------------------------------------------------------------------------------

ADD rootfs /

#------------------------------------------------------------------------------
# Expose ports and entrypoint:
#------------------------------------------------------------------------------
EXPOSE 8118 7070

ENTRYPOINT ["/entrypoint.sh"]
