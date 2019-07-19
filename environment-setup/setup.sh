#!/bin/bash

mkdir -v ~/.local
mkdir -v ~/.local/bin

pushd ~/.local/bin

wget https://releases.hashicorp.com/terraform/0.11.14/terraform_0.11.14_linux_amd64.zip
unzip terraform_0.11.14_linux_amd64.zip
rm terraform_0.11.14_linux_amd64.zip

wget https://github.com/drone/drone-cli/releases/download/v1.1.2/drone_linux_amd64.tar.gz
tar -xvf drone_linux_amd64.tar.gz
rm drone_linux_amd64.tar.gz

popd

rsync -tpv $(dirname "${0}")/.Xmodmap ~/.Xmodmap
rsync -rtpv $(dirname "${0}")/.local/bin/ ~/.local/bin/
