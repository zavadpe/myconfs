#!/bin/sh
#
# Post installation script for Max OS system
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
BASHRC=https://raw.githubusercontent.com/zavadpe/myconfs/master/linux/.bashrc
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

