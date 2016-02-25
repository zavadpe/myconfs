#!/bin/sh
#
# Post installation script for apt/ubuntu systems
#
# Installs all needed applications for development and basic work.
#

# Downloads file $1 to the $2 location
downloadFile() {
    link=$1
    where=$2
    echo ">> Downloading  $link to $where"
    wget $link $where
}

createDir() {
    dir=$1
    echo ">> Creating directory $dir"
    mkdir -p $dir
}

# links
BASHRC=https://github.com/zavadpe/myconf/blob/master/.bashrc
VIMRC=https://github.com/zavadpe/myconf/blob/master/.vimrc
GITCONFIG=https://github.com/zavadpe/myconf/blob/master/.gitconfig

# directories
BIN=$HOME/bin
DEV=$HOME/dev
PROJECTS=$DEV/projects

echo "> Running postinstall script"

downloadFile $BASHRC $HOME
downloadFile $VIMRC $HOME
downloadFile $GITCONFIG $HOME

# Apply .bashrc profile
. $HOME/.bashrc

createDir $BIN
createDir $DEV
createDir $PROJECTS

# Install misc packages
sudo apt-get update
sudo apt-get install terminator vim git gitg preload vlc build-essential 
