# !/usr/bin/env sh
# -*- coding:utf-8; mode:shell-script; -*-

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
# echo -e "\t>>== Star of ~/.bashrc"

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

# set console font, the fonts can be found in /usr/lib/kbd/consolefonts/
# or in /usr/share/consolefonts/
LANG=zh_CN.UTF-8
LC_NAME=zh_CN.UTF-8
export LANG LANGUAGE
if [ -n "$(tty | grep tty)" ]; then
    font=/usr/share/consolefonts/CyrSlav-Terminus22x11.psf.gz
    if [ -r $font ]; then
	setfont $font
    fi
    export LANG=en_US.UTF-8
    export LC_NAME=en_US.UTF-8
fi
if [ "${TERM}" = fbterm ]; then
    # echo -e "\t\t>>>=== Set console font\n"
    # export http_proxy=http://127.0.0.1:8087
    # export https_proxy=http://127.0.0.1:8087
	echo
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

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


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --group-directories-first --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
else
    alias ls='ls --group-directories-first -F'
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    # echo -e "\t\t>>>=== Star of ~/.bash_aliases"
    . ~/.bash_aliases
    # echo -e "\t\t>>>=== End of ~/.bash_aliases"
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

# echo -e "\t>>== End of ~/.bashrc"

# = + = + = + = + = + = + = + = + = + = + = + = By MengYuan = + = + = + = + = + = + = + = + = + = + = + =

# Sun Java path and env
# export JAVA_HOME=~/bin/jre1.8.0_25/
# export PATH=$JAVA_HOME/bin:$PATH
export VISUAL='emacsclient -a emacs'
export EDITOR='emacsclient -a emacs'
# [ -n "$FBTERM" ] && export TERM="fbterm"
# [[ $(tty) == \/dev\/tty[0-9]* ]] && bash -c 'fcitx &> /dev/null; fbterm -- tmux'
[[ $(tty) == \/dev\/tty[0-9]* ]] && bash -c '
export FRAMEBUFFER=/dev/fb0 && tmux ls &>/dev/null \
	&& ~/bin/fbterm-bi -- env TERM=fbterm tmux att \
	|| ~/bin/fbterm-bi -- env TERM=fbterm tmux'


# Enable tab completion
source ~/git-completion.bash
# Change command prompt
source ~/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
# '\u' adds the name of the current user to the prompt
# '\$(__git_ps1)' adds git-related stuff
# '\W' adds the name of the current directory

# = + = + = + = + = + = + = + = + = + = + = + = + = + = + = + = + = + = + = + = + = + = + = + = + = + =


function youdl() {
    if [ $# -ge 1 ]
    then
	if [ "${1:0:1}" = "-" ]
	then
	    /opt/downloads/dl.sh $@
	    return
	fi

	for ((i=$1; i<=$2; i++)); do
	    echo "No. $i:"
	    /opt/downloads/dl.sh $i 1 $(echo $@ | cut -d' ' -f3-) -l $(tail -n +$i /opt/downloads/urls | head -1)
	done
    fi
}

# function bl() {
#     pushd /sys/class/backlight/nv_backlight/ &> /dev/null
#     brightness=$(($1+0))
#     if [[ "$1" = "on" ]]; then
# 	sudo su -c "echo '5' > ./brightness"
#     elif [[ "$1" = "off" ]]; then
# 	printf '5s 后按 Y|y 可开背光\n'
# 	sleep 5
# 	sudo su -c "echo '0' > ./brightness"
# 	will_on="Y"
# 	read -n1 -p '要不要打开背光呀? ( Y|n )' will_on
# 	echo ''
# 	if [ "$will_on" = "Y" -o "$will_on" = "y" ]; then
# 	    sudo su -c "echo '5' > ./brightness"
# 	fi
#     elif [ $brightness -le 100 -a $brightness -gt 0 ]; then
# 	sudo su -c """echo "$brightness" > ./brightness"""
#     fi
#     popd &> /dev/null
# }

function get_apt_url() {
    url="""$(apt-get -q --print-uris -y $@ 2> /dev/null | egrep "^'http://" | cut -d' ' -f1)"""

    if [ "${url%%/*}" != "'http:" ]; then
	url=''
    fi
    echo $url

    return 0
}

function aptdl() {
    url="$(get_apt_url $@ 2> /dev/null)"

    if [ -z "$url" ]; then
	return -1
    fi

#    if [ "${@/update/}" != "$@" ]; then
#	[ "${@/update/}" != "$@" ] && echo 'update'
#	return 0
#	for l in $url; do
#	    fn=${l#*\/\/}	# 删除开头的 "http://"
#	    fn=${fn%.*}		# 删除 '.' 后面的内容
#	    fn=${fn/\//_}		# 将 '/' 替换成 '_'
#	    fn=${fn/_/%5f}	# 将 '_' 替换成 "%5f"
#	    echo "$l" | xargs -l1 sudo axel -a -n2 -o "/var/lib/apt/lists/$fn"
#	done
#    elif [ "${@/upgrade/}" != "$@" -o "${@/install/}" != "$@" ]; then
#	return 0
#	for l in $url; do
#	    fn=${l##*\/}	# 删除最后的 '/' 及前面部分，保持下载的文件名不变
#	    echo "$1" | xargs -l1 sudo axel -a -n2 -o"/var/cache/apt/archives/$fn"
#	done
#    fi

    for l in $url; do
	fn=${l##*\/}	# 删除最后的 '/' 及前面部分，保持下载的文件名不变
	fn=${fn%\'*}	# 删除文件名后的 "'"
	echo "$l" | xargs -l1 sudo axel -a -n2 -o"/var/cache/apt/archives/$fn"
    done

    return 0
}

function aptaxel() {
    read -n1 -t5 -p '''Q: 是要下载呢还是要下载安装呢，仅下载么？[Y/n]
A: 我想想(就5秒): ''' is_only_dl

    aptdl $@
    if [ $? -ne 0 ]; then
	echo "Oh! No! 下载失败！？"
	return 1
    fi
    case "$is_only_dl" in
	y|Y|\b)
	    echo "Oh! Yet! 成功了！
不过还没安装呢，
可以运行 sudo apt-get $@ 进行安装哦！"
	    return 0
	    ;;
	*)
	    ;;
    esac

    sudo apt-get --no-download $@

    return 0
}

function lscolor_light_bg() {
	for ((j=40;j<=47;j++)); do
		for ((k=0;k<=4;k++)); do
			if [ $k -eq 3 ]; then
				continue
			fi
			for ((i=30;i<=37;i++)); do
				echo -ne "\033[0$k;${j}m\033[05;${i}m 0$k;$j 05;$i \033[0m"
			done
			echo ""
		done
	done
		for ((i=30;i<=37;i++)); do
			for ((j=40;j<=47;j++)); do
				echo -ne "\033[03;${j}m\033[05;${i}m 03;$j 05;$i \033[0m"
			done
			echo ""
		done;
}

function lscolor() {
	for ((j=40;j<=47;j++)); do
		for ((k=0;k<=4;k++)); do
			if [ $k -eq 3 ]; then
				continue
			fi
			for ((i=30;i<=37;i++)); do
				echo -ne "\033[0$k;${j}m\033[06;${i}m 0$k;$j 06;$i \033[0m"
			done
			echo ""
		done
	done

	for ((j=1;j<=7;j++)); do
	    for ((i=30;i<=37;i++)); do
		echo -ne "\033[0$j;${i}m 0$j;$i \033[0m"
	    done
	    echo ""
	done
}


if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[00;47m\]\[\033[05;30m\]\u\[\033[05;32m\]@\[\033[05;31m\]\h\[\033[00m\]\[\033[01;44m\]\[\033[06;33m\]$(__git_ps1)\[\033[00m\]\[\033[01;41m\] \W \$\[\033[0m\] '
    # PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\e[33;4m\]\u\[\e[0m\]@\[\e[32m\]\h\[\e[0m\]:\[\e[31m\]\w\[\e[0m\]\$ '
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

# Local Variables:
# coding: utf-8
# mode: shell-script
# END:
