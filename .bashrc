# source global definitions
[ -f /etc/bash_completion ] && source /etc/bash_completion
[ -f /etc/bashrc ] && source /etc/bashrc

# allow local scoping
function .bashrc() {

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

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
export JAVA_HOME=/usr
export ANT_HOME=/usr/share/ant
export PATH=$PATH:$HOME/.node/bin # node binaries
export MANPATH=$MANPATH:$HOME/.node/share/man # node manuals
export PATH=$PATH:$HOME/android-sdks/platform-tools/ # android binaries

# shell behaviour
function git_branch {
	local output="$(echo "$1" | awk '/# Initial commit/ {print "(init)"}')"
	[[ "$output" ]] || output="$(echo "$1" | awk '/# On branch/ {print $4}')"
	[[ "$output" ]] || output="$(git branch | perl -ne '/^\* (.*)/ && print $1')"
	echo "$output"
}
function git_flags {
	echo "$1" | perl -ne '/^# Your branch is ahead of .* by ([0-9]+) commits?.$/ && print "$1"'
	echo "$1" | perl -ne '/^# Changes to be committed:$/ && print "+"'
	echo "$1" | perl -ne '/^# Changes not staged for commit:$/ && print "!"'
	echo "$1" | perl -ne '/^# Untracked files:$/ && print "?"'
}
local format_git_info="st=\"\$(git status 2>/dev/null)\"; [[ \$? != 0 ]] || echo \"$grey∓$purple\$(git_branch \"\$st\")$green\$(git_flags \"\$st\")\""
local success_indicator="if [ \$? == 0 ]; then echo \"$green✓\"; else echo \"$red✗\"; fi"
local cwd="which ppwd &> /dev/null; if [ \$? == 0 ]; then ppwd 28; else pwd; fi"
export PS1="\$($success_indicator)$yellow\u$grey@$blue\h$grey:$red\$($cwd)\$($format_git_info)$white\\\$ $styleEnd"
export PS2="$white«\$$black;$styleEnd"
export PS4='+${BASH_SOURCE}:${LINENO}:${FUNCNAME[0]}: '
export CDPATH=".:$HOME"
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
alias l=ls
alias sl=ls
alias ls='ls -bhlpq --color=auto --group-directories-first'
alias la='ls -A'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias less='less -JKmqRSw'
alias which='which --show-tilde --show-dot'
alias mkdir='mkdir -pv'
alias grep='grep --color=auto -Rn'
which ack &>/dev/null && alias grep='ack --no-group'
alias df='df -hPT --total'
alias du='du -hc'
alias bc='bc -ilqw'
alias split='split -d -b 1K'
alias wget='wget -c --timeout=10'
alias ip='dig +short myip.opendns.com @resolver1.opendns.com'
alias ssh='ssh -X'
alias rsync='rsync --rsh=ssh -PzEphvr --stats'
alias scp='scp -Cpr'
alias fetch-torrents='rsync --rsh=ssh -PzEphvr --stats root@seedbox:/torrents/'
alias pstree='pstree -aclU'
alias scala='scala -i $HOME/.scalarc'
alias skype='LD_PRELOAD=/usr/lib/libv4l/v4l1compat.so nohup skype &>/dev/null &'
alias cowsay='cowsay -e o0 -T "U " -f small'
alias cowthink='cowthink -e o0 -T "U " -f small'
alias rb=ruby
alias hs=ghci
alias no='yes no'
alias v=vim
alias g=git
alias o=xdg-open
alias pager=less
alias editor=vim
alias dirs='dirs -l -p -v'
alias back='cd -'
alias cd..='cd ..'
alias ...='cd ../.. && pwd'
alias ....='cd ../../.. && pwd'
alias .....='cd ../../../.. && pwd'
alias :q=exit

function demo {
	local    red='\[\033[0;31m\]'
	local  green='\[\033[0;32m\]'
	local  white='\[\033[1;37m\]'
	local styleEnd='\[\033[0m\]'
	export PS1="\$(if [ \$? == 0 ]; then echo -ne \"$green\"; else echo -ne \"$red\"; fi; echo -ne \"\\\$$styleEnd \")"
	clear
}

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
