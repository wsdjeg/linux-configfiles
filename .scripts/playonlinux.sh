#!/usr/bin/env bash

echo "Installing PlayOnLinux (wine)."

if [ -d $REPO/.PlayOnLinux ]; then
  rm -rf $REPO/.PlayOnLinux
fi
ln -s $REPO/.PlayOnLinux ~

sudo apt-get install -u playonlinux
