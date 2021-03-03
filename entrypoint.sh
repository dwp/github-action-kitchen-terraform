#!/bin/sh -l

kitchen $1 | sed "s/$2/REDACTED/g"
