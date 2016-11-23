#!/usr/bin/env bash

echo "Installing android."

#if [ -f ~/.npmrc ]; then
#  rm ~/.npmrc
#fi
#ln -s $REPO/.npmrc ~

#sudo apt-add-repository ppa:paolorotolo/android-studio -y
#sudo apt-get update
#sudo apt-get install android-studio -y

sudo apt-get install -y default-jdk

mkdir -p ~/Applications
cd ~/Applications
wget https://dl.google.com/dl/android/studio/ide-zips/2.1.3.0/android-studio-ide-143.3101438-linux.zip
unzip android-studio-ide-143.3101438-linux.zip
rm android-studio-ide-143.3101438-linux.zip
