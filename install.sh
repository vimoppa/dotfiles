#!/usr/bin/env bash

if [ -z $USER_WORKDIR ]; then
  echo "env => USER_WORKDIR not set: '$USER_WORKDIR' "
  exit $?
fi

# config symlinks are handled separately
declare dotfiles_files=("bin" "config" "install.sh" "readme")

function setup_config() {
  # symlink config to $HOME/.config directory
  for c in $USER_WORKDIR/dotfiles/config/*; do
    local cfg="${c##*/}"
    local config="${HOME}/.config/${cfg}"

    [ -e "${config}" ] && {
      echo "${cfg} link exists, cleaning up..."
      rm -rf "${config}"
    }

    ln -s "${c}" $"${config}" && {
      echo "new '${config}' linked"
    }
  done
}

function run() {
  #    command_exists git || {
  #        echo "git is not installed"
  #        exit 1
  #    }

  ln -s $USER_WORKDIR/zshrc ~/.zshrc
  ln -s $USER_WORKDIR/gitconfig ~/.gitconfig
  ln -s $USER_WORKDIR/git ~/.git

  # setup config symlinks
  setup_config
}

run $@
