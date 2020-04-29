#!/bin/sh

#------------------------------------------------------------------------------
# Configure the service:
#------------------------------------------------------------------------------
env nohup ss-local -s $SERVER_ADDR -p $SERVER_PORT -k $PASSWORD \
  -b 0.0.0.0 -l ${LOCAL_PORT:-7070} -m $METHOD  -u --fast-open &

env /usr/sbin/privoxy --no-daemon /etc/privoxy/config
