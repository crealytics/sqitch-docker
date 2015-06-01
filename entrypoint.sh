#!/bin/sh
sqitch "$@"
# $LOCALUID is an env variable set by docker run
chown -R $LOCALUID:$LOCALUID /src
