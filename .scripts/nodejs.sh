#!/usr/bin/env bash

echo "NOT Installing nodejs. TODO: Implement."

if [ -f ~/.npmrc ]; then
  rm ~/.npmrc
fi
ln -s $REPO/.npmrc ~
