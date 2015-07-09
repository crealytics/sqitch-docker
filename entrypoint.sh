#!/bin/bash
host=$(env | grep _TCP_ADDR | head -1 | cut -d = -f 2)
port=$(env | grep _TCP_PORT | head -1 | cut -d = -f 2)

echo -n "waiting for TCP connection to $host:$port..."

while ! ((echo > /dev/tcp/$host/$port) >/dev/null 2>&1)
do
  echo -n .
  sleep 1
done

echo "Got connection"

sqitch "$@"

# $LOCALUID, $LOCALGID are env variables set by docker run
if [ -n "$LOCALUID" -a -n "$LOCALGID" ]; then
  chown -R $LOCALUID:$LOCALGID /src
fi
