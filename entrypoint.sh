#!/bin/sh -l

update-ca-certificates

# This ensures that kitchen errors are maintained when piped through sed
set -o pipefail

if [ -z "$2" ]; then
  kitchen $1
else
  kitchen $1 | sed "s/$2/REDACTED/g"
fi
