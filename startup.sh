#!/bin/sh

set -e

echo "Starting json-server..."

if [ ! -f /init ]; then
  echo "Preparing /db.json for collections '$COLLECTIONS'..."
  node /init.js
  touch /init
fi

export DELAY=""
if [ "$RESPONSE_DELAY_MS" != "" ]; then
  export DELAY="--delay $RESPONSE_DELAY_MS"
fi

set -x
json-server -H 0.0.0.0 -p 3000 /db.json $DELAY

