# .bash_profile

export PATH="/usr/local/bin:$PATH"
export PATH="$PATH:$HOME/.cabal/bin"

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
if [ -f "$HOME/.git-completion.bash" ]; then
  . "$HOME/.git-completion.bash"
fi

[ -s "$HOME/.nvm/nvm.sh" ] && . "$HOME/.nvm/nvm.sh" # This loads nvm
