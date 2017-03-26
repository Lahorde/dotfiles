if [ -f /etc/bash_completion ]; then
	    . /etc/bash_completion
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Specific aliases (non permanent, depending on some projects, specific environment...)
if [ -f ~/.bash_special_aliases ]; then
    . ~/.bash_special_aliases
fi

# Specific bashrc (non permanent, depending on some projects, specific environment...)
if [ -f ~/.bash_special ]; then
    . ~/.bash_special
fi

xhost +local:root > /dev/null 2>&1

complete -cf sudo

shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob
shopt -s histappend
shopt -s hostcomplete
shopt -s nocaseglob

export HISTSIZE=10000
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL=ignoreboth

# ex - archive extractor
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

export EDITOR=vim

export LD_LIBRARY_PATH=/usr/local/lib/:$LD_LIBRARY_PATH

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# 256 colors
if [ -n "$DISPLAY" -a "$TERM" == "xterm" ]; then
	export TERM=xterm-256color
fi 

#Supprime raccourci Ctrl + s afin qu'il soit dispo pour vim 
bind -r '\C-s'
stty -ixon
