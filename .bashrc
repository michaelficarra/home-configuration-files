# source global definitions
[ -f /etc/bash_completion ] && source /etc/bash_completion
[ -f /etc/bashrc ] && source /etc/bashrc

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# allow local scoping
function .bashrc() {

# colours
local  black='\[\033[1;30;40m\]'
local    red='\[\033[0;31;40m\]'
local  green='\[\033[0;32;40m\]'
local yellow='\[\033[0;33;40m\]'
local   blue='\[\033[0;34;40m\]'
local purple='\[\033[0;35;40m\]'
local   cyan='\[\033[0;36;40m\]'
local  white='\[\033[0;37;40m\]'
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
local DIR="if [ -x $(which ppwd) ]; then echo \$(ppwd); else echo \$(pwd); fi"
export PS1="$black:$white $yellow\u$white@$blue\h$white:$red\$($DIR)$white\$ $black;$styleEnd "
export PS2="$white«\$$styleEnd "
export PS4='+${BASH_SOURCE}:${LINENO}:${FUNCNAME[0]}: '
CDPATH=".:$HOME"
export EDITOR=vim
export HISTCONTROL=ignoredups
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
alias v='vim'
alias g='git'
alias git='hub'
alias back='cd -'
alias dirs='dirs -l -p -v'
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
