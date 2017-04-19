# ~/.bash_aliases
alias ls-last="find . -printf '%T+ %p\n' |sort -r |head"
alias hg="history |grep"
alias psg="ps ax|grep"
alias top='top -o %CPU'

#before sourcing some configuration files tmux server must be started (new-sesion, start-server, attach-session) start it
alias tmux_session="tmux start-server \; source-file ~/.tmux_session"
alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias grep='grep --color=tty -d skip'
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano PKGBUILD'

alias systemctl_restart_log='systemctl_restart_log'

# Aliases requiring params
systemctl_restart_log()
{
  sudo sytemctl restart $1
  journalctl -u $1 -f
}

