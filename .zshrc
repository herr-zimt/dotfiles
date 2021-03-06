#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
unsetopt CORRECT

source ~/.zsh_aliases
export EDITOR=vim
export PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"

# Switch back and forth between two jobs
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# Invoked whenever you change working directory
function chpwd() {
  ls
  chruby_auto # ugly workaround for chruby zsh
}

# Handy emacs
bindkey '^P' up-line-or-search
bindkey '^R' history-incremental-search-backward
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^G' insert-last-word
bindkey '^O' push-line

KEYTIMEOUT=20

# Chruby madness
source /usr/share/chruby/chruby.sh
source /usr/share/chruby/auto.sh

# added by travis gem
[ -f /home/zimt/.travis/travis.sh ] && source /home/zimt/.travis/travis.sh
