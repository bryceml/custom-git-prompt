#!/bin/bash

echo -e "\e[33mMaking directory ~/.bash/\e[39m"
mkdir "${HOME}/.bash"

echo -e "\e[33mCopying scripts to ~/.bash/\e[39m"
cp -ai $(dirname "${0}")/git-completion "${HOME}/.bash/"
cp -ai $(dirname "${0}")/git-prompt "${HOME}/.bash/"
cp -ai $(dirname "${0}")/github-shortcuts "${HOME}/.bash/"

echo -e "\e[33mAppending bashrc to ~/.bashrc\e[39m"
cat $(dirname "${0}")/bashrc >> "${HOME}/.bashrc"

echo -e "\e[33mAppending applicable prompt to ~/.bashrc\e[39m"
if [ "${USER}" == "root" ]; then
  cat $(dirname "${0}")/prompt-red >> "${HOME}/.bashrc"
else
  cat $(dirname "${0}")/prompt >> "${HOME}/.bashrc"
fi

echo -e "\e[33mAdding aliases to ~/.gitconfig\e[39m"
git config --global alias.graph "log --graph --pretty=format:'%C(auto)%d %h %cr %Cblue%an %Creset %s'"
git config --global alias.ls "ls-files"
git config --global alias.count "rev-list HEAD --count"
git config --global alias.wdiff "diff --word-diff"

# Allow arg 1 to be used to use in scripts easier
if [ -z ${1} ]
then
  # If arg 1 is "n" then do not configure github-shortcuts
  if [ "${1}" == "n" ]
  then
    exit
  fi
  echo -n -e "\e[33mDo you want to configure github-shortcuts? [y/n]:\e[39m "
  while true; do
      read yn
      case $yn in
          [Yy]* ) echo -e "\e[33mInput your github username for github-shortcuts:\e[39m"
                  read line
                  sed -i "s/yourgithubusernamehere/$line/g" "${HOME}/.bash/github-shortcuts"
                  break;;
          [Nn]* ) break;;
          * ) echo -n -e "\e[33mPlease answer yes or no:\e[39m ";;
      esac
  done
else
  sed -i "s/yourgithubusernamehere/${1}/g" "${HOME}/.bash/github-shortcuts"
fi
