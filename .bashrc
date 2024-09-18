# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
# export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"
# export VBOX_INSTALL_PATH="/mnt/d/Program Files/Oracle/VirtualBox"
export PATH="$PATH:/home/emanon/tools/apache-maven-3.9.6/bin"

# some more ls aliases
# alias ll='ls -alF'
alias ll='ls -l'
alias la='ll -a'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# sudoedit
export VISUAL="vim"
export EDITOR="$VISUAL"

# alias vi='busybox vi'
alias als='vim ~/.bashrc'
alias vrc='vim ~/.vimrc'
alias re='source ~/.bashrc'
alias bn='basename'
alias cl='clear'
alias v='vim'
# alias ll='pwd && ls -la'
alias lt='ls -ltr'
alias lt1='ls -1tr'
alias s='find $PWD -name 2>/dev/null'
alias sd='find $PWD -type d -name 2>/dev/null'
alias jl='jobs -l'
alias v='vim'
alias sv='sudoedit'
alias hosts='sudoedit /etc/hosts'

alias j1='fg %1'
alias j2='fg %2'
alias j3='fg %3'
alias j4='fg %4'
alias j5='fg %5'
alias j6='fg %6'
alias j7='fg %7'
alias j8='fg %8'
alias j9='fg %9'

alias dssh='docker exec -it d2 /etc/init.d/ssh restart'
alias dkssh='docker start bf'

bind -m vi-command 'z: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

bind '"\C-p":history-search-backward'
bind '"\C-n":history-search-forward'
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'


j() {
  fg %$1
}

cd() {
  #builtin cd $@
  command cd $@ && echo " " && ll
}

pt(){
  export whoami=whoami
  PS1="$(whoami)@\${PWD##*/}\> "
}
# 當前目錄 顯示多個檔名的路徑(包含檔名)
sf(){
  for file in "$@"; do
    s $(basename $file)
    #basename $file
    #dirname $(s $(basename $file))
  done
}

# 當前目錄 顯示多個檔名的路徑(不包含檔名)
sfd(){
  echo " "
  for file in "$@"; do
    basename $file
    s $(basename $file) | xargs -I {} dirname {}
  done
}

# 當前目錄 依據檔名備份多個檔
# search & bak
# args[]: multiple filenames, seperate by spaces
sbak(){
  for file in "$@"; do
    bakDate=$(date "+%Y-%m-%d_%H%M%S")
    targetPath=$(s $(basename $file))
    echo $targetPath.bak@$bakDate
    cp $targetPath $targetPath.bak@$bakDate
  done
}

# 當前目錄 依據檔名取代多個檔
srep(){
  for file in "$@"; do
    targetPath=$(s $(basename $file))
    echo $targetPath
    cp $file $targetPath
  done
}

# find
# args: date, filename
fb () {
  find $PWD -type f ! -newermt "$2" -name "$1" -printf "%T@ %Tc %p\n" | sort -n
}

# find & rm before date
# args: date, filename
frmb () {
  find $PWD -type f ! -newermt "$2" -name "$1" -printf "%T@ %Tc %p\n" | sort -n && find . -type f ! -newermt "$2" -name "$1" -exec rm -f {} \;
}

function mkdir
{
  command mkdir -p $1 && cd $1
}


############## git ######################
alias g='git log --all --decorate --oneline --graph'
