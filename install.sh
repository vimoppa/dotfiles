#!/usr/bin/env bash

if [ -z $USER_WORKDIR ]
then
    echo "env => USER_WORKDIR not set: '$USER_WORKDIR' "
    exit $?
fi

# delete and recreate specific user configuration files
# NOTE: user specific configuration files are in gitignore
## [ -e "viminfo" ] && rm "./viminfo" || touch "./viminfo"


# symlink dotfiles to $HOME directory
for f in $USER_WORKDIR/dotfiles/*
do
    if [ "${f##*/}" != "install.sh" ] && [ "${f##*/}" != "readme" ]
    then
	    ln -s "$f" "$HOME/.${f##*/}"
    fi
done
