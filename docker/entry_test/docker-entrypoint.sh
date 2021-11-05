#!/bin/sh

if [ ! -d "/tmp/check" ]; then
  mkdir /tmp/check
  echo first
else
  echo second
fi

exec "$@"
