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

######################
##### COMPLETION #####
######################

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*:functions' ignored-patterns '_*'          # Ignore completion functions for commands

##################
##### CONFIG #####
##################

HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000
WORDCHARS=${WORDCHARS//\/[&.;]}                                 # Don't consider certain characters part of the word
DISABLE_UNTRACKED_FILES_DIRTY="true"                            # Disable marking untracked files under VCS as dirty.
DISABLE_AUTO_TITLE="true";
export LC_ALL=en_US.UTF-8                                       # solves locale warnings
export MANPAGER='nvim +Man!'
# export MANWIDTH=999
export VISUAL=nvim
export EDITOR="$VISUAL"
export TERMINAL="konsole"
export BROWSER="firefox"
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


#################
##### ALIAS #####
#################

alias v="nvim"
alias a="agenda"
alias n="note"

alias -g ...='../..'
alias -g ....='../../..'
alias cp="cp -uv"
alias mv="mv -uv"
alias ls="ls -lah"
alias top="bashtop";
alias open="xdg-open"

alias vi="nvim";
alias vim="nvim";
alias note="vi ~/MEGASync/notes/private/index.md";
alias wnote="vi ~/MEGASync/notes/private/Programming_Notes.md";
alias bnote="vi ~/MEGASync/notes/private/Bookmarks.md";
alias story="vi -S ~/MEGASync/story.vim"
alias agenda="vi -S ~/MEGASync/agenda.vim"

alias show-public-ip="curl ifconfig.co";
alias show-private-ip="ip addr"; # TODO get only ip from output
alias adb-connect="adb connect 192.168.0.190:5555";
alias http-server="echo Starting server on 8080; python3 -m http.server 8080 &";
alias scrcap="adb shell screencap /sdcard/scrcap.png && \
  adb pull /sdcard/scrcap.png ~/Documents/scr/$(date '+%s').png && \
  adb shell rm /sdcard/scrcap.png"
alias music="nohup mpv --no-audio-display --shuffle ~/Music < /dev/null > /dev/null 2>&1 & disown"
alias ramfs="sudo mount -t tmpfs -o size=5g tmpfs /mnt/ramfs"


################
##### PATH #####
################

export PATH="/usr/local/bin\
:/usr/local/sbin\
:$HOME/.local/bin\
:$HOME/.npm-global/bin\
:/usr/bin\
:/bin\
:/usr/sbin\
:/sbin";


##################
##### PROMPT #####
##################

PROMPT='%1~ · '
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{yellow}%b'
zstyle ':vcs_info:*' enable git


################
##### INIT #####
################

eval "$(rbenv init -)"
