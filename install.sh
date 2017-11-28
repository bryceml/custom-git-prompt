#!/bin/bash

echo -e "\e[33mInput your github username for github-shortcuts:\e[39m"
read line
sed -i "s/yourgithubusernamehere/$line/g" github-shortcuts

echo -e "\e[33mMaking directory ~/.bash/\e[39m"
mkdir $HOME/.bash

echo -e "\e[33mCopying scripts to ~/.bash/\e[39m"
cp -ai git* $HOME/.bash/

echo -e "\e[33mAppending bashrc to ~/.bashrc\e[39m"
cat bashrc >> $HOME/.bashrc

echo -e "\e[33mAdding aliases to git\e[39m"
git config --global alias.graph "log --graph --pretty=format:'%C(auto)%d %h %cr %Cblue%an %Creset %s' --branches"
git config --global alias.ls "ls-files"
git config --global alias.count "rev-list HEAD --count"
git config --global alias.wdiff "diff --word-diff"
