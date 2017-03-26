#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
RED='\033[0;31m'
NC='\033[0m' # No Color

# trap ctrl-c and call ctrl_c()
trap ctrl_c INT

function ctrl_c() {
exit 1
}

user_files=(".bashrc" ".bash_aliases" ".tmux.conf" ".tmux_session" ".vimrc")
echo "Installing user dot files"
for file in "${user_files[@]}"
do
  abs_path_file="${DIR}/${file}"
  if [ ! -z "~/${file}" ]
  then
    # check if it already points to dotfile
    if ls -l ~/${file} | grep -q "$abs_path_file"
    then
      echo "$file exists already points to dotfile"
      continue
    else
      echo "$file exists - save it as ${file}.bak"
      mv ~/${file} ~/${file}.bak  
    fi
  fi
  echo "install $file from dotfiles project"
  ln -s "$abs_path_file" ~
done

if ! tmux -V > /dev/null 2>&1
then
  echo -e "${RED}please install tmux using your package manager. tmux version must be >= 2.1 ${NC}"
fi  

echo "install tmux plugin manager"
if git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm > /dev/null 2>&1
then
  echo -e "${RED}After installation, run tmux and Press prefix + I (capital I, as in Install) to fetch the plugins. ${NC}" 
else
  echo "tmux plugin manager already installed" 
fi 

echo "install vim vundle"
if git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim > /dev/null 2>&1
then
  echo -e "${RED}After installation, run vim and enter :PluginInstall ${NC}"
else
  echo "vundle already installed"
fi 

global_files=("bash.bashrc" "DIR_COLORS")
echo "Installing global dot files"
for file in "${global_files[@]}"
do
  abs_path_file="${DIR}/global/${file}"
  if [ ! -z "/etc/${file}" ]
  then
    # check if it already points to dotfile
    if ls -l /etc/${file} | grep -q "$abs_path_file"
    then
      echo "$file exists already points to dotfile"
      continue
    else
      echo "$file exists - save it as ${file}.bak"
      sudo mv /etc/${file} /etc/${file}.bak  
    fi
  fi
  echo "install $file from dotfiles project"
  sudo ln -s "$abs_path_file" "/etc"
done
