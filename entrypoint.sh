#!/bin/sh -l

update-ca-certificates

if [ -z "$2" ]; then
  kitchen $1
else
  kitchen $1 | sed "s/$2/REDACTED/g"
fi
