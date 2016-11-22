#!/bin/sh

# add repo
sudo apt-add-repository ppa:git-core/ppa -y
sudo add-apt-repository ppa:neovim-ppa/unstable -y

sudo apt-get update

sudo apt-get install docker.io vim git python-pip -y

