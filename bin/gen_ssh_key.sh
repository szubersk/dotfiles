#!/bin/bash

keyfile=$HOME/.ssh/keys/$1

if [[ -e $keyfile ]]; then
  echo >&2 "key '$keyfile' already exists!"
  exit 1
fi

password=$(uuidgen -r)
ssh-keygen -N "$password" -f "$keyfile" -t ed25519 -C "$1"
echo "private key password: $password"
