#!/usr/bin/env bash

echo "Installing Terraform."

if [ -f ~/.bin/terraform ]; then
  rm ~/.bin/terraform
fi

cd $REPO/.bin

wget https://releases.hashicorp.com/terraform/0.7.3/terraform_0.7.3_linux_amd64.zip

unzip terraform_0.7.3_linux_amd64.zip

rm terraform_0.7.3_linux_amd64.zip
