#!/usr/bin/env bash

if [ -z $USER_WORKDIR ]; then
  echo "env => USER_WORKDIR not set: '$USER_WORKDIR' "
  exit $?
fi

# config symlinks are handled separately

function setup_config() {
  # symlink config to $HOME/.config directory
  for c in $USER_WORKDIR/dotfiles/config/*; do
    local cfg="${c##*/}"
    local config="${HOME}/.config/${cfg}"

    ln -shfv "${c}" $"${config}"
  done
}

function run() {
  ln -shfv $USER_WORKDIR/dotfiles/zshrc "${HOME}/.zshrc"
  ln -shfv $USER_WORKDIR/dotfiles/tmux.conf "${HOME}/.tmux.conf"
  ln -shfv $USER_WORKDIR/dotfiles/gitconfig "${HOME}/.gitconfig"
  ln -shfv $USER_WORKDIR/dotfiles/git "${HOME}/.git"

  # setup config symlinks
  setup_config
}

run $@
