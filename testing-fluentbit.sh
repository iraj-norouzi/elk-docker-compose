#!/usr/bin/env bash

set -Eeuo pipefail

DEBUG="${DEBUG:-}"

if [[ -n $DEBUG ]]; then

  set -x

fi

LOCAL_DIR="$( cd "$( dirname "$0" )" && pwd)"
LOG_NAME="sp-samples-1k.log"

docker run -ti -v $LOCAL_DIR/$LOG_NAME:/$LOG_NAME \
  fluent/fluent-bit:1.2 \
  /fluent-bit/bin/fluent-bit \
  -R /fluent-bit/etc/parsers.conf \
  -i tail \
  -p path=/$LOG_NAME \
  -p parser=json \
  -o stdout -f 1 &

sleep 10

kill %1

sleep 5

docker run -ti -v $LOCAL_DIR/$LOG_NAME:/$LOG_NAME \
  fluent/fluent-bit:1.2 \
  /fluent-bit/bin/fluent-bit \
  -R /fluent-bit/etc/parsers.conf \
  -i tail \
  -p path=/$LOG_NAME \
  -p parser=json \
  -T "SELECT word, num FROM STREAM:tail.0 WHERE country='Chile';" \
  -o null -f 1

