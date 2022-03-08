#!/bin/zsh

# Global alias
export SSH_ASKPASS=/usr/bin/ksshaskpass
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR"/ssh-agent.socket

# Tell zsh where to look for our dotfiles.
ZDOTDIR=~/.config/zsh
