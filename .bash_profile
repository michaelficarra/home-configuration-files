# .bash_profile

export PATH="/usr/local/bin:$PATH"

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# git autocompletion
if [ -f ~/.git-completion.bash ]; then
  # https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
  . ~/.git-completion.bash
fi


[ -s "$HOME/.nvm/nvm.sh" ] && . "$HOME/.nvm/nvm.sh" # This loads nvm
