#!/usr/bin/env bash

echo "Installing Chromium."

sudo apt install -y chromium-browser

sudo add-apt-repository ppa:ne0sight/chrome-gnome-shell -y
sudo apt-get update
sudo apt-get install chrome-gnome-shell -y
