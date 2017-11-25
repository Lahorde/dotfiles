#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
RED='\e[0;31m'
GREEN='\e[32m'
NC='\e[0m' # No Color
BOLD='\e[1m'
NORMAL='\e[0m' # Reset all

# trap ctrl-c and call ctrl_c()
trap ctrl_c INT

function ctrl_c() {
exit 1
}

function show_text
{
  echo -e "  > "$1"" 
}

function show_warning
{
  echo -e "${RED}$1${NORMAL}" 
}

function show_main_step
{
  echo -e "${BOLD}${GREEN}$1${NORMAL}" 
}

function run_command 
{
  if [ "$#" -eq 2 ]
  then
    echo -n "  > " 
    eval "echo "$2""
  fi
  
  if ! eval "$1" 
  then
    echo "Error when executing $1 - exiting"
    end
    exit 1
  fi
}
user_files=(".bashrc" ".bash_aliases" ".tmux.conf" ".tmux_session" ".vimrc")
show_main_step "Installing user dot files"
for file in "${user_files[@]}"
do
  abs_path_file="${DIR}/${file}"
  if [ ! -z "~/${file}" ]
  then
    # check if it already points to dotfile
    if ls -l ~/${file} | grep -q "$abs_path_file"
    then
      show_text "$file exists already points to dotfile"
      continue
    else
      run_command 'mv ~/${file} ~/${file}.bak' '$file exists - save it as ${file}.bak'
    fi
  fi
  run_command 'ln -s "$abs_path_file" ~' 'install $file from dotfiles project'
done

if ! tmux -V > /dev/null 2>&1
then
  show_warning "please install tmux using your package manager. tmux version must be >= 2.1"
fi  

show_main_step "install tmux plugin manager"
if ! git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm > /dev/null 2>&1
then
  show_text "tmux plugin manager already installed" 
fi 
run_command '~/.tmux/plugins/tpm/scripts/install_plugins.sh > /dev/null' 'update/install tmux plugins'

show_main_step "install vim vundle"
if ! git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim > /dev/null 2>&1
then 
  show_text "vundle already installed"
fi 
run_command 'vim -c "PluginInstall" -c "qa!"' 'update/install vim plugins'

global_files=("bash.bashrc" "DIR_COLORS")
show_main_step "Installing global dot files"
for file in "${global_files[@]}"
do
  abs_path_file="${DIR}/global/${file}"
  if [ ! -z "/etc/${file}" ]
  then
    # check if it already points to dotfile
    if ls -l /etc/${file} | grep -q "$abs_path_file"
    then
      show_text "$file exists already points to dotfile"
      continue
    else
      run_command 'sudo mv /etc/${file} /etc/${file}.bak' '$file exists - save it as ${file}.bak'
    fi
  fi
  run_command 'sudo ln -s "$abs_path_file" "/etc"' 'install $file from dotfiles project'
done
