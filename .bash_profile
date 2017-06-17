# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
if [ -f "$HOME/.git-completion.bash" ]; then
  . "$HOME/.git-completion.bash"
fi
