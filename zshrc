source $HOME/.nix-profile/etc/profile.d/nix.sh
# source ~/.vimrc
# source ~/.kitty.conf
 
# NIX environment
export NIXPKGS_ALLOW_UNFREE=1
export NIXPKGS_ALLOW_UNSUPPORTED_SYSTEM=1
export NIXPKGS_ALLOW_BROKEN=1
 
# EDITOR
export EDITOR='nvim'
# Alias for vim
alias vim='nvim'
alias vi='nvim'
 
# POSTGRESQL
export PGHOST=localhost
export PGUSER=postgres
export MYSQL_ALLOW_EMPTY_PASSWORD=yes
 
# GPG KEY
export GPG_TTY=$(tty)
 
# SPACESHIP PROMPT - (Install via nix-pkg)
autoload -U promptinit; promptinit
prompt spaceship
 
# disable bell sound
set bell-style none



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
