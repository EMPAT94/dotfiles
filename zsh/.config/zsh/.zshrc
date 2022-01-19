#!/bin/zsh

###################
##### OPTIONS #####
###################

setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt autocd                                                   # if only directory path is entered, cd there.
setopt inc_append_history                                       # save commands are added to the history immediately, otherwise only when shell exits.

###################
##### PLUGINS #####
###################

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

######################
##### COMPLETION #####
######################

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path /tmp/cache
zstyle ':completion:*:functions' ignored-patterns '_*'          # Ignore completion functions for commands

##################
##### CONFIG #####
##################

HISTFILE=${ZDOTDIR}/.zhistory
HISTSIZE=1000
SAVEHIST=1000
WORDCHARS=${WORDCHARS//\/[&.;]}                                 # Don't consider certain characters part of the word
DISABLE_UNTRACKED_FILES_DIRTY="true"                            # Disable marking untracked files under VCS as dirty.
DISABLE_AUTO_TITLE="true";
export LC_ALL=en_US.UTF-8                                       # solves locale warnings
export MANPAGER='nvim +Man!'
export VISUAL=nvim
export EDITOR="$VISUAL"
export TERMINAL="kitty"
export BROWSER="brave"
export KEYTIMEOUT=1

#######################
##### KEYBINDINGS #####
#######################

bindkey -e
zmodload zsh/terminfo
bindkey '^[[3~' delete-char                                     # Delete key
bindkey '^[[C'  forward-char                                    # Right key
bindkey '^[[D'  backward-char                                   # Left key
bindkey '^[[5~' history-beginning-search-backward               # Page up key
bindkey '^[[6~' history-beginning-search-forward                # Page down key

################
##### PATH #####
################

export PATH="$HOME/.local/bin/\
:$HOME/.local/npm/bin\
:/usr/local/bin\
:/usr/local/sbin\
:/usr/bin\
:/usr/sbin\
:/bin\
:/sbin";

#################
##### ALIAS #####
#################

alias ...='../..'
alias v="nvim"
alias a="agenda"
alias w="wiki"
alias n="note"
alias l="exa --icons --long --header --all"
alias y="yay"

alias ls="exa --icons"
alias cp="cp -uv"
alias mv="mv -uv"
alias top="bpytop";
alias open="xdg-open"
alias tree="exa --icons --tree"
alias ssh="kitty +kitten ssh"
alias ruby="ruby2.7"
alias bundle="bundle-2.7"
# alias lua="luajit" # ln -s /usr/bin/luajit ~/.local/bin/lua, for when aliases are not imported

alias vi="nvim";
alias vim="nvim";
alias wiki="nvim -S ~/MEGASync/wiki.vim"
alias note="nvim -S ~/MEGASync/notes.vim"
alias notes="nvim -S ~/MEGASync/notes.vim"
alias story="nvim -S ~/MEGASync/story.vim"

alias show-public-ip="curl ifconfig.co";
alias show-private-ip="ip addr | rg '192.*/'";
alias adb-connect="adb connect 192.168.0.190:5555";
alias http-server="echo Starting server on 8889; python3 -m http.server 8889 &";
alias scrcap="adb shell screencap /sdcard/scrcap.png && \
  adb pull /sdcard/scrcap.png ~/Documents/scr/$(date '+%s').png && \
  adb shell rm /sdcard/scrcap.png"
alias ramfs="sudo mount -t tmpfs -o size=5g tmpfs /mnt/ramfs"

##################
##### PROMPT #####
##################

PROMPT='%1~ · '
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{blue}%b'
zstyle ':vcs_info:*' enable git
