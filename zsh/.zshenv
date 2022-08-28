#!/bin/zsh

# Global env
export LC_ALL=en_US.UTF-8             # solves locale warnings
export MANPAGER='nvim +Man!'
export VISUAL=nvim
export EDITOR="$VISUAL"
export TERMINAL="kitty"
export BROWSER="firefox"
export KEYTIMEOUT=1
export HOMEBREW_NO_ENV_HINTS=1 # do not print any hints about changing Homebrew´s behaviour

# User aliases
[[ -r ~/.config/zsh/.aliases ]] && source ~/.config/zsh/.aliases

# Tell zsh where to look for our dotfiles.
ZDOTDIR=~/.config/zsh
