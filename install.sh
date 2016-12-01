#!/bin/sh

# add repo
sudo apt-add-repository ppa:git-core/ppa -y
sudo add-apt-repository ppa:neovim-ppa/unstable -y

sudo apt-get update

# DOCKER VIM MAVEN JDK
sudo apt-get install \
    docker.io \
    git \
    maven \
    openjdk-8-jre-headless \
    python-dev python-pip python3-dev python3-pip neovim \
    -y

# Création workspace
mkdir ~/workspace
cd ~/workspace

# Vim config files
git clone https://github.com/cyrillebonnaud/vim_conf.git && cd vim_conf
git submodule init && git submodule update

# Add symlinks to neovim config files
mkdir ~/.config
ln -s ./.vim ~/.config/nvim
ln -s ./.vimrc ~/.config/nvim/init.vim
# Remove viminfo file to prevent neovim issue 3469
rm ~/.viminfo

# bashrc
cd ~/workspace
curl https://raw.githubusercontent.com/cyrillebonnaud/bash_aliases/master/.bash_aliases >> ~/.bashrc
source ~/.bashrc

# Git conf
curl https://raw.githubusercontent.com/cyrillebonnaud/git_conf/master/git_conf | sh
