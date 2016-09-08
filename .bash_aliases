# ~/.bash_aliases
alias ls-last="find . -printf '%T+ %p\n' |sort -r |head"
alias hg="history |grep"
alias psg="ps ax|grep"

#RP - seg fault when exporting 
alias makerware="env LC_ALL=\"en_US.UTF-8\" makerware"

#KICAD aliases
kicad_find_mod(){
    grep -ri $1 /usr/share/kicad/modules/ --include=*.mod
}

kicad_find_lib(){
    grep -ri $1 /usr/share/kicad/library/ --include=*.lib
}

alias tmux_session="tmux new-session tmux source-file ~/.tmux_session"
alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias grep='grep --color=tty -d skip'
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano PKGBUILD'
