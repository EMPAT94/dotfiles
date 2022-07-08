#!/usr/bin/zsh


###################
##### OPTIONS #####
###################

setopt append_history         # Immediately append history instead of overwriting
setopt auto_cd                # if only directory path is entered, cd there.
setopt extended_glob          # Extended globbing. Allows using regular expressions with *
setopt hist_expire_dups_first # Remove dups before uniques when trimming
setopt hist_find_no_dups      # Do not display dupes when searching through hist
setopt hist_ignore_all_dups
setopt hist_ignore_dups       # Do not enter command into the history if they are duplicates
setopt hist_ignore_space
setopt hist_save_no_dups      # When writing out the history file, older commands that duplicate newer ones are omitted.
setopt inc_append_history     # save commands are added to the history immediately, otherwise only when shell exits.
setopt no_beep                # No beep
setopt no_case_glob           # Case insensitive globbing
setopt no_check_jobs          # Don't warn about running processes when exiting
setopt numeric_glob_sort      # Sort filenames numerically when it makes sense
setopt rc_expand_param        # Array expension with parameters


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
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'  # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"    # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                         # automatically find new executables in path
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path /tmp/cache
zstyle ':completion:*:functions' ignored-patterns '_*'     # Ignore completion functions for commands


##################
##### CONFIG #####
##################

HISTFILE=${ZDOTDIR}/.zhistory
HISTSIZE=1000
SAVEHIST=1000
WORDCHARS=${WORDCHARS//\/[&.;]}       # Don't consider certain characters part of the word
DISABLE_UNTRACKED_FILES_DIRTY="true"  # Disable marking untracked files under VCS as dirty.
DISABLE_AUTO_TITLE="true";
export LC_ALL=en_US.UTF-8             # solves locale warnings
export MANPAGER='nvim +Man!'
export VISUAL=nvim
export EDITOR="$VISUAL"
export TERMINAL="kitty"
export BROWSER="firefox"
export KEYTIMEOUT=1


#######################
##### KEYBINDINGS #####
#######################

bindkey -e
zmodload zsh/terminfo
bindkey '^[[3~' delete-char                        # Delete key
bindkey '^[[C'  forward-char                       # Right key
bindkey '^[[D'  backward-char                      # Left key
bindkey '^[[5~' history-beginning-search-backward  # Page up key
bindkey '^[[6~' history-beginning-search-forward   # Page down key


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


###################
##### ALIASES #####
###################

alias ...='../..'
alias l="exa --icons --long --header --all"
alias v="nvim"
alias w="wiki"
alias y="yay"

alias cp="cp --update --verbose"
alias fd="fd --ignore-case --follow" # i = ignore case, L = follow symlinks
alias ls="exa --icons"
alias mv="mv --update --verbose"
alias py="python"
alias vi="nvim";

alias icat="kitty +kitten icat"
# alias lua="luajit" # ln -s /usr/bin/luajit ~/.local/bin/lua, for when aliases are not imported
alias music="mocp"
alias open="xdg-open"
# alias ssh="kitty +kitten ssh" # Only required once, when logging first time
alias top="bpytop";
alias tree="exa --icons --tree"
alias vim="nvim";
alias vlci="vlc --intf ncurses --random --loop --audio --recursive --no-video"

alias adb-connect="adb connect 192.168.0.190:5555";
alias decrypt="gpg -d" # file.gpg -> file
alias encrypt="gpg -er Pritesh" # file -> file.gpg
alias http-server="echo Starting server on 8889; python3 -m http.server 8889";
alias ramfs="sudo mount -t tmpfs -o size=5g tmpfs /mnt/ramfs"
alias show-private-ip="ip addr | rg '192.*/'";
alias show-public-ip="curl ifconfig.co";

wiki() {
  cd ~/Notes
  nvim index.md +Telescope\ find_files
}

clear_zsh_history() {
  echo > ~/.config/zsh/.zhistory
}

# requires docker and pandoc image
pandoc() {
   echo pandoc $@
   docker run -it --rm -v "$PWD:/work" -w /work pandoc/core "$@"
}

scrcap() {
  adb shell screencap /sdcard/scrcap.png
  adb pull /sdcard/scrcap.png ~/Documents/scr/$(date '+%s').png
  adb shell rm /sdcard/scrcap.png
}

clean_package_cache() {
  yay -Sc
  yay -cc
  pamac clean
}

# For example, to run a testrunner T on dir change D
# $ watch_and_do D T
watch_and_do() {
  while true; do watch -g ls -l $1 >/dev/null && ${*:2}; sleep 5; done
}


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


###############
##### INIT ####
###############

[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh
