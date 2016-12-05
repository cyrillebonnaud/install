#!/bin/sh

# add repo
sudo apt-add-repository ppa:git-core/ppa -y
sudo add-apt-repository ppa:neovim-ppa/unstable -y

sudo apt-get update

# DOCKER VIM MAVEN JDK
sudo apt-get install \
    docker.io \
    docker-compose \
    git \
    maven \
    eclipse \
    openjdk-8-jre-headless \
    python-dev python-pip python3-dev python3-pip neovim \
    -y

# Création workspace
sudo chown $USER:$USER $HOME
sudo mkdir ~/workspace
cd ~/workspace

# Vim config files
sudo git clone https://github.com/cyrillebonnaud/vim_conf.git && cd vim_conf
sudo git submodule init && sudo git submodule update
# Add symlinks to neovim config files
sudo mkdir ~/.config
sudo ln -s ~/workspace/vim_conf/.vim ~/.config/nvim
sudo ln -s ~/workspace/vim_conf/.vimrc ~/.config/nvim/init.vim
# Remove viminfo file to prevent neovim issue 3469
sudo rm ~/.viminfo

# bashrc
cd ~/workspace
sudo touch ~/.bash_aliases
sudo curl https://raw.githubusercontent.com/cyrillebonnaud/bash_aliases/master/.bash_aliases > ~/.bash_aliases
. ~/.bash_aliases #source

# Git conf
curl https://raw.githubusercontent.com/cyrillebonnaud/git_conf/master/git_conf | sudo sh

# Selenium
sudo pip install selenium
