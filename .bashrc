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

# homebrew installations
local dir
for dir in /usr/local/opt/*/libexec/gnubin; do
	PATH="$dir:$PATH"
done
for dir in /usr/local/opt/*/libexec/gnuman; do
	MANPATH="$dir:$MANPATH"
done
# FOSS projects
for dir in $HOME/projects/*/bin; do
	PATH="$PATH:$dir"
done
[ -d "$HOME/bin" ] && export PATH="$HOME/bin:$PATH"
export PATH="$PATH:node_modules/.bin:$HOME/node_modules/.bin" # node binaries
export MANPATH="$MANPATH:$HOME/.node/share/man" # node manuals
export PATH="$PATH:.cabal-sandbox/bin:$HOME/.cabal/bin" # cabal binaries
export PATH="$PATH:$HOME/android-sdks/platform-tools" # android binaries

# shell behaviour
function git_branch {
	local output="$(echo "$1" | awk '/^Initial commit/ {print "(init)"}')"
	[[ "$output" ]] || output="$(echo "$1" | awk '/^On branch/ {print $4}')"
	[[ "$output" ]] || output="$(git branch | perl -ne '/^\* (.*)/ && print $1')"
	echo "$output"
}
function git_flags {
	echo "$1" | perl -ne '/^Changes to be committed:$/ && print "+"'
	echo "$1" | perl -ne '/^Changes not staged for commit:$/ && print "!"'
	echo "$1" | perl -ne '/^Untracked files:$/ && print "?"'
	echo "$1" | perl -ne '/^Your branch is ahead of .* by ([0-9]+) commits?.$/ && print "$1"'
}
export LANG=en_US.UTF-8
local format_git_info="st=\"\$(git status 2>/dev/null)\"; [[ \$? != 0 ]] || echo \"$grey#$purple\$(git_branch \"\$st\")$cyan\$(git_flags \"\$st\")\""
local success_indicator="if [ \$? == 0 ]; then echo \"${green}:\"; else echo \"${red}X\"; fi"
local cwd=pwd
if [ $(which ppwd &> /dev/null; echo $?) -eq 0 ]; then
  local pwd_width="35"
  if [ -n $COLUMNS ]; then pwd_width="\$(expr '(' \$COLUMNS / 2 ')' - 10)"; fi
  cwd="ppwd $pwd_width";
fi
export PS1="\$($success_indicator)$yellow[$blue\$($cwd)$yellow]\$($format_git_info)$white\\\$ $styleEnd"
export PS2="$white«\$$black;$styleEnd"
export PS4='+${BASH_SOURCE}:${LINENO}:${FUNCNAME[0]}: '
export CDPATH=".:$HOME"
export EDITOR=vim
export PAGER=less
export LESS='-iRS'
export LESS_TERMCAP_me=$(printf '\e[0m')
export LESS_TERMCAP_se=$(printf '\e[0m')
export LESS_TERMCAP_ue=$(printf '\e[0m')
export LESS_TERMCAP_mb=$(printf '\e[1;32m')
export LESS_TERMCAP_md=$(printf '\e[1;34m')
export LESS_TERMCAP_us=$(printf '\e[1;32m')
export LESS_TERMCAP_so=$(printf '\e[1;44;1m')
export HISTCONTROL=ignoredups
export TERM=xterm-256color
shopt -s checkwinsize               # Auto-recognition of window size
#shopt -s dirspell                   # Correct misspellings when tab-completing
shopt -s histappend                 # Don't overwrite HISTFILE
shopt -s no_empty_cmd_completion    # Don't tab-complete on empty line

# aliases
alias l=ls
alias sl=ls
alias ls='ls --color=auto --escape --group-directories-first --hide-control-chars --human-readable --indicator-style=slash -l'
alias la='ls --almost-all'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias less='less --chop-long-lines --hilite-unread --long-prompt --quiet --quit-on-intr --RAW-CONTROL-CHARS --status-column'
alias which='which --show-dot --show-tilde'
alias mkdir='mkdir --parents --verbose'
alias grep='grep --color=auto --line-number --recursive'
which ack &>/dev/null && alias grep='ack --no-group'
alias yum='sudo yum'
alias df='df --human-readable --portability --print-type --total'
alias du='du --human-readable --total'
alias bc='bc --interactive --mathlib --quiet --warn'
alias split='split --numeric-suffixes --bytes=1M'
alias wget='wget --continue --timeout=10'
alias ip='dig +short myip.opendns.com @resolver1.opendns.com'
alias ssh='ssh -X'
alias whereami='geoip $(ip)'
alias rsync='rsync --rsh=ssh --compress --hard-links --human-readable --partial --perms --progress --recursive --sparse --stats --times --update --verbose'
alias scp='scp -Cpr'
alias fetch-torrents='rsync --rsh=ssh root@seedbox:/torrents/'
alias pstree='pstree -aclU'
alias scala='scala -i $HOME/.scalarc'
alias skype="LD_PRELOAD=\"/usr/lib/libv4l/v4l1compat.so\${LD_PRELOAD:+:\$LD_PRELOAD}\" nohup skype &>/dev/null &"
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
alias :q=exit # vim
alias :t=which # ghci

which xclip &>/dev/null && alias copy=xclip && alias paste='xclip -o'
which pbcopy &>/dev/null && alias copy=pbcopy
which pbpaste &>/dev/null && alias paste=pbpaste

local exitCode=0
while [ $exitCode -le 255 ]; do
	alias $exitCode="\`exit $exitCode\`"
	alias -- -$exitCode="\`exit -$exitCode\`"
	exitCode=$(($exitCode+1))
done

function demo {
	local   red='\[\033[0;31m\]'
	local green='\[\033[0;32m\]'
	local white='\[\033[1;37m\]'
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
