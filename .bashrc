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

# prompt set in bash.bashrc
#PS1='[\u@\h \W]\$ '

export EDITOR=vim

#WINE parameters
export WINEARCH=win32 WINEPREFIX=~/.wine_installs/win32 
#export WINEARCH=win64 WINEPREFIX=~/.wine_installs/win64

#use python 2 instead of python 3 - for nodejs
export PYTHON=`which python2`

# virtualenv and virtualenvwrapper
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME=$HOME/.virtualenvs
source /usr/bin/virtualenvwrapper.sh

#for Nordic SDK
export OS=Linux

export PATH="$PATH:$HOME/.npm_global/bin"
export PATH="$PATH:/home/data/remi/dev_tools/Embedded/Raspberry/tools/arm-bcm2708/arm-bcm2708hardfp-linux-gnueabi/bin/"

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# 256 colors
if [ -n "$DISPLAY" -a "$TERM" == "xterm" ]; then
	export TERM=xterm-256color
fi 

#Supprime raccourci Ctrl + s afin qu'il soit dispo pour vim 
bind -r '\C-s'
stty -ixon
#tmux_session
