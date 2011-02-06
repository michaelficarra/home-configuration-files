# source global definitions
[ -f /etc/bash_completion ] && source /etc/bash_completion
[ -f /etc/bashrc ] && source /etc/bashrc

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# allow local scoping
function .bashrc() {

# colours
local  black='\[\033[8;30m\]'
local    red='\[\033[0;31m\]'
local  green='\[\033[0;32m\]'
local yellow='\[\033[0;33m\]'
local   blue='\[\033[0;34m\]'
local purple='\[\033[0;35m\]'
local   cyan='\[\033[0;36m\]'
local   grey='\[\033[0;37m\]'
local  white='\[\033[1;37m\]'
local styleEnd='\[\033[0m\]'

# path modifications
local dir
for dir in $HOME/projects/*/bin; do
	PATH="$PATH:$dir"
done
[ -d "$HOME/bin" ] && export PATH="$HOME/bin:$PATH"
export CLASSPATH=.:/usr/java:/usr/lib
export JAVA_HOME=/usr/java/default
export ANT_HOME=/usr/share/ant

# shell behaviour
local DIR="if [ -x $(which ppwd) ]; then echo \$(ppwd 28); else echo \$(pwd); fi"
export PS1="$black: $grey[$yellow\u$grey@$blue\h$grey:$red\$($DIR)$grey]$white\$$black;$styleEnd"
export PS2="$white«\$$styleEnd "
export PS4='+${BASH_SOURCE}:${LINENO}:${FUNCNAME[0]}: '
CDPATH=".:$HOME"
export EDITOR=vim
export HISTCONTROL=ignoredups
export TERM=xterm-256color
shopt -s checkjobs                  # Warn on exit if background jobs exist
shopt -s checkwinsize               # Auto-recognition of window size
shopt -s dirspell                   # Correct misspellings when tab-completing
shopt -s globstar                   # Allow the use of the ** wildcard
shopt -s histappend                 # Don't overwrite HISTFILE
shopt -s no_empty_cmd_completion    # Don't tab-complete on empty line

# aliases
alias ls='ls -bhlpq --color=auto --group-directories-first'
alias la='ls -A'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias less='less -JKmqRSw'
alias which='which --show-tilde --show-dot'
alias mkdir='mkdir -p -v'
alias df='df -h -P -T --total'
alias du='du -h -c'
alias bc='bc -ilqw'
alias wget='wget -c'
alias ssh='ssh -X'
alias cowsay='cowsay -e o0 -T "U " -f small'
alias cowthink='cowthink -e o0 -T "U " -f small'
alias v='vim'
alias g='git'
alias git='hub'
alias back='cd -'
alias dirs='dirs -l -p -v'
alias o='xdg-open'
alias :q='exit'
alias cd..='cd ..'
alias ...='cd ../.. && pwd'
alias ....='cd ../../.. && pwd'
alias .....='cd ../../../.. && pwd'

function ..() {
	case $# in
		0) cd .. ;;
		*)
			n=$1;
			dir='.';
			while [ $n -gt 0 ]; do
				dir="$dir/.."
				n=$(($n-1))
			done
			cd $dir
		;;
	esac
	pwd
}

}
# commit
.bashrc
function .bashrc() {
	source "$HOME/.bashrc"
}
