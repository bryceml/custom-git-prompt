#!/bin/bash

echo -e "\e[33mInput your github username for github-shortcuts:\e[39m"
read line
sed -i "s/yourgithubusernamehere/$line/g" github-shortcuts

echo -e "\e[33mMaking ~/.bash directory\e[39m"
mkdir $HOME/.bash

echo -e "\e[33mCopying scripts to ~/.bash/\e[39m"
cp -ai git* $HOME/.bash/

echo -e "\e[33mAppending bashrc to ~/.bashrc\e[39m"
cat bashrc >> $HOME/.bashrc
