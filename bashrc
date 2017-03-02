
export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_DESCRIBE_STYLE="branch"
source ~/.bash/git-completion
source ~/.bash/git-prompt
source ~/.bash/github-shortcuts
PROMPT_COMMAND='__git_ps1 '"'"'${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[01;00m\]:\[\033[01;34m\]\w\[\033[00m\]'"'"' '"'"' \$ '"'"''