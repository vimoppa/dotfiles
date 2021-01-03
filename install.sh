#!/usr/bin/env bash

if [ -z $USER_WORKDIR ]
then
    echo "env => USER_WORKDIR not set: '$USER_WORKDIR' "
    exit $?
fi

# delete and recreate specific user configuration files
# NOTE: user specific configuration files are in gitignore
## [ -e "viminfo" ] && rm "./viminfo" || touch "./viminfo"

function run() {

# symlink dotfiles to $HOME directory
for f in $USER_WORKDIR/dotfiles/*
do
    local file="${f##*/}"
    local file_home="$HOME/.$file"

    if [ "$file" != "install.sh" ] && [ "$file" != "readme" ]
    then
        # cleanup symlink, if existing
        [ -e "$file_home" ] && {
            echo "$file link exists, cleaning up..."
            rm "$file_home"
        }

        ln -s "$f" "$file_home" && {
            echo "new '$file_home' linked"
        }
    fi
done

local VIM_START_PLUGIN_DIR="$HOME/.vim/pack/plugins/start"

for p in $VIM_START_PLUGIN_DIR/*
do
    if [ -d "$p/doc" ]
    then
        vim -u NONE -c "helptags $p/doc" -c q
    fi
done
}

run $@
