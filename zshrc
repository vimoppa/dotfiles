source $HOME/.nix-profile/etc/profile.d/nix.sh

export PATH="/opt/homebrew/opt/go@1.18/bin:$PATH"
export PATH="/usr/local/opt/openjdk/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="$PATH":"$HOME/.pub-cache/bin"
eval "$(/opt/homebrew/bin/brew shellenv)"

# For compilers to find libpq you may need to set:
export LDFLAGS="-L/opt/homebrew/opt/libpq/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libpq/include"

## go private repo for oremi
export GOPRIVATE=github.com/oremi-co/*

# NIX environment
export NIXPKGS_ALLOW_UNFREE=1
export NIXPKGS_ALLOW_UNSUPPORTED_SYSTEM=1
export NIXPKGS_ALLOW_BROKEN=1

# nvm config; note: nvm is no more managed by homebrew.
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh" # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# cargo
source "$HOME/.cargo/env"
CARGO_NET_GIT_FETCH_WITH_CLI=true # Cargo will use the git executable to fetch registry indexes and git dependencies

# GPG KEY
export GPG_TTY=$(tty)

# SPACESHIP PROMPT - (Install via nix-pkg)
autoload -U promptinit; promptinit
prompt spaceship

# EDITOR settings
export EDITOR='nvim'
alias vim='nvim'
alias vi='nvim'

# disable bell sound
set bell-style none

# terminal language settings
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# theme
#ZSH_THEME="spaceshidp"

# aliases
#source ~/.aliases

# exports
#source ~/.exports

## plugins
#plugins=(
#  git
#  docker
#  dotenv
#  osx
#  golang
#)

# source $ZSH/oh-my-zsh.sh
