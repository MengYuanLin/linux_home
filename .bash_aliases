# !/usr/bin/env sh
# -*- coding:utf-8; mode:shell-script; -*-

# ~/.bash_aliases: sourced by ~/.bashrc for non-login shells.

alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias llh='ls -alhF'

alias view='vim -R'

alias sync='for (( a=0; a<5; a++ )); do sudo sync; done'

alias xdec='sdcv -u XDICT英汉辞典'
alias oxec='sdcv -u Oxford\ Eng-Chinese\ Dict\ V4.0'
alias sdec='sdcv -u stardict1.3英汉辞典'
alias cpec='sdcv -u 简明英汉词典'

alias xdce='sdcv -u XDICT汉英辞典'
alias ustd='sdcv -u 美国传统词典[双解]'
alias cndc='sdcv -u 高级汉语词典'
alias eccp='sdcv -u 英汉双解计算机词典'

alias mplayer='mplayer -ao alsa -vo fbdev2 -vfm ffmpeg \
      	-lavdopts lowres=0:fast:skiploopfilter=all \
	-x 1366 -y 702 -zoom -fs -really-quiet'


# export FRAMEBUFFER=/dev/fb0 && fbterm -- env TERM=fbterm tmux
# for T in `l /usr/share/terminfo/*/`; do C=$(infocmp "${T##*/}"
# 		2>/dev/null | egrep -i "colors#256"); if [ -n "$C" ]; then printf
# 		"${T##*/}:\t$C\n">>/tmp/tmux-1000/term_256color; fi; done; echo
# alias emacs='TERM=rxvt-unicode-256color emacs'
# alias emacs='TERM=rxvt-256color emacs'
# alias emacs='TERM=screen-256color emacs'
# alias emacs='TERM=xterm-256color emacs'
# alias emacs='TERM=screen-256color-bce emacs'
# alias emacs='TERM=screen-256color-bce-s emacs'
if [[ ${TERM} = linux ]]; then
    echo "" &>/dev/null
fi

alias tmux='env TERM=fbterm tmux'
alias emacs='TERM=rxvt-unicode-256color emacs'
alias nxemacs='TERM=rxvt-unicode-256color emacs-nox'

function psuxf() {
    ps uxf | grep -v "grep" | egrep "CPU|PID|$1"
}

export mplayer


# Local Variables:
# coding: utf-8
# mode: shell-script
# END:
