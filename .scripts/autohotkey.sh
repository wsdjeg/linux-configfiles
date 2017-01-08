#!/usr/bin/env bash

echo "Installing AuthHotKey (wine)."

if [ -f $REPO/.bin/AutoHotkey.exe ]; then
  rm $REPO/.bin/AutoHotkey.exe
fi

cd $HOME/.bin
wget https://autohotkey.com/download/ahk-u64.zip
unzip ahk-u64.zip
rm ahk-u64.zip
chmod +x $HOME/.bin/AutoHotkey.exe
