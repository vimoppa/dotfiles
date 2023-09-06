source $HOME/.nix-profile/etc/profile.d/nix.sh

export PATH="/opt/homebrew/opt/go@1.18/bin:$PATH"
export PATH="/usr/local/opt/openjdk/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="$PATH":"$HOME/.pub-cache/bin"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
eval "$(/opt/homebrew/bin/brew shellenv)"

# For compilers to find libpq you may need to set:
export LDFLAGS="-L/opt/homebrew/opt/libpq/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libpq/include"

## go private repo for oremi
export GOPRIVATE=github.com/oremi-co/*
export AWS_PROFILE=22array ### set to `default` for Onramper configuration

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
export CARGO_NET_GIT_FETCH_WITH_CLI=true # Cargo will use the git executable to fetch registry indexes and git dependencies
# let g:rustfmt_autosave=1 # enable automatic running of :RustFmt when you save a buffer

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

export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# Dynamically add all node versions installed via nvm to beginning of PATH,
# to take precedence over any other node version 
# (i.e. installed via brew install node or any formula dependencies)
for f in $HOME/.nvm/versions/node/*; do
  if [ -d "$f" ]; then
      PATH=$f/bin:$PATH
  fi
done

# pnpm
export PNPM_HOME="/Users/chukwuanu/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# exports and shortcuts for working within github.com/vimoppa
export OPPA="$HOME/src/github.com/vimoppa"
vimoppa () # change directory to $OPPA 
{
  cd $OPPA
}

dotfiles ()
{
  cd "$OPPA/dotfiles/"
  vi .
}

# see: https://stackoverflow.com/questions/65612411/forcing-docker-to-use-linux-amd64-platform-by-default-on-macos/69636473#69636473
export DOCKER_DEFAULT_PLATFORM=linux/amd64

# export POSTGRES_HOST=localhost
# export POSTGRES_DB=postgres
# export POSTGRES_USER=postgres
# export POSTGRES_PASSWORD=postgres

export PGPORT=5432
export PGHOST=localhost 
export PGUSER=chukwuanu
export PGDB=postgres
