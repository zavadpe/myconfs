#!/bin/sh
#
# Post installation script for apt/ubuntu systems
#
# Installs all needed applications for development and basic work.
#

# Downloads file $1 to the $2 location
downloadFile() {
    link=$1
    file=$2
    echo ">> Downloading  $link to $file"
    wget -O $file $link
}

createDir() {
    dir=$1
    echo ">> Creating directory $dir"
    mkdir -p $dir
}

# links
BASHRC=https://raw.githubusercontent.com/zavadpe/myconfs/master/.bashrc
VIMRC=https://raw.githubusercontent.com/zavadpe/myconfs/master/.vimrc
GITCONFIG=https://raw.githubusercontent.com/zavadpe/myconfs/master/.gitconfig

# directories
BIN=$HOME/bin
DEV=$HOME/dev
PROJECTS=$DEV/projects

echo "> Running postinstall script"

downloadFile $BASHRC $HOME/.bashrc
downloadFile $VIMRC $HOME/.vimrc
downloadFile $GITCONFIG $HOME/.gitconfig

# Apply .bashrc profile
. $HOME/.bashrc

createDir $BIN
createDir $DEV
createDir $PROJECTS

# Install misc packages
sudo apt-get update
sudo apt-get install terminator vim git gitg preload vlc build-essential

