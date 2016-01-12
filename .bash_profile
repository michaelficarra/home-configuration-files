# .bash_profile

# start ssh-agent if it is not already started
SSH_ENV="$HOME/.ssh/environment"
function start_agent {
  if [ -f "${SSH_ENV}" ]; then
    source "${SSH_ENV}" >/dev/null
    ps --pid "${SSH_AGENT_PID}" >/dev/null && return;
  fi
  echo "Initialising new SSH agent..."
  touch "${SSH_ENV}"
  chmod 600 "${SSH_ENV}"
  ssh-agent > "${SSH_ENV}"
  source "${SSH_ENV}" >/dev/null
  find ~/.ssh/keys -perm 0600 | xargs ssh-add &>/dev/null
}
start_agent;

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
if [ -f "$HOME/.git-completion.bash" ]; then
  . "$HOME/.git-completion.bash"
fi
