#!/bin/sh
sqitch "$@"
echo "Changing ownership..."
# $LOCALUID is an env variable set by docker run
chown -R $LOCALUID:$LOCALUID /src
