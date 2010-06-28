# source global definitions
if [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# path modifications
export CLASSPATH=.:/usr/java:/usr/lib
export JAVA_HOME=/usr/java/default
export ANT_HOME=/usr/share/ant

# shell behaviour
PROMPT_COMMAND='history -a'
CDPATH='.:~'
PS1='#\u@\h:\W\$ '
export EDITOR=vim
export HISTCONTROL=ignoredups

# aliases
alias ls='ls -bhlpq --color=auto --group-directories-first'
alias la='ls -A'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias mkdir='mkdir -p -v'
alias df='df -h -P -T --total'
alias du='du -h -c'
alias back='cd -'
alias dirs='dirs -l -p -v'
alias wget='wget -c'
alias :q='exit'
alias bc='bc -ilqw'
alias cd..='cd ..'
alias ...='cd ../.. && pwd'
alias ....='cd ../../.. && pwd'
alias .....='cd ../../../.. && pwd'

# Pseudo-programs
alias reload='. ~/.bashrc'
alias bashrc='vim ~/.bashrc'
alias ports='sudo netstat -ap --inet'
alias activeports='sudo lsof -i'
alias update='sudo yum -y --skip-broken update'
alias lock='gnome-screensaver-command --lock'
alias gnome-screensaver-inhibit='gnome-screensaver-command --inhibit'
function ..() {
	case $# in
		0) cd .. ;;
		*)
			n=$1;
			dir='';
			while [ $n -gt 0 ]; do
				dir="$dir../"
				n=$(($n-1))
			done
			cd $dir
		;;
	esac
	pwd
}
run() {
	nohup $@ &>/dev/null &
}
extract() {
	if [ -f $1 ] ; then
		case $(echo "$1" | tr '[:upper:]' '[:lower:]') in
			*.tar.bz2)  tar xvjf $1    ;;
			*.tar.gz)   tar xvzf $1    ;;
			*.bz2)      bunzip2 $1     ;;
			*.rar)      unrar x $1     ;;
			*.gz)       gunzip $1      ;;
			*.tar)      tar xvf $1     ;;
			*.tbz2)     tar xvjf $1    ;;
			*.tgz)      tar xvzf $1    ;;
			*.zip)      unzip $1       ;;
		#	*.Z)        uncompress $1  ;;
			*.7z)       7za x $1       ;;
			*)          echo "extract: Unknown file type: '$1'..." ;;
		esac
	else
		echo "\"$1\" is not a valid file!"
	fi
}
