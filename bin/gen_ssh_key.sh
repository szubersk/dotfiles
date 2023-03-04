#!/bin/bash

file=$(mktemp -u -t ed25519.XXX)
ssh-keygen -q -C '' -N '' -t ed25519 -f "$file"

printf "private key:\n%s\n\npublic key:\n" "$file"
cat "$file.pub"
