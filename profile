# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.

# Symlink this to ~/.profile:
# rm ~/.profile && ln -sf ~/git/dotfiles/profile ~/.profile
#
# Note: do NOT place secrets in this file, since it is public on GitHub. Place them in the file below:
[ -f ~/.profile_secrets ] && . ~/.profile_secrets

# Branch/etc completion in git.
# To get this working on macOS: brew install bash-completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# For a more pleasant command-line git experience.
. $HOME/git/dotfiles/git-prompt.sh

# Add some color to the default prompt. Shamelessly copied from a Debian default profile.
# The __git_ps1 part is important for the git-prompt.sh above to function correctly.
PROMPT_HOST_COLOR=${PROMPT_HOST_COLOR:-1;32}
PROMPT_TIME_COLOR=${PROMPT_TIME_COLOR:-32}
export PS1='\033[${PROMPT_TIME_COLOR}m[\t]\033[0m \[\033[${PROMPT_HOST_COLOR}m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\033[36m$(__git_ps1)\033[0m\n\$ '

# If this is an xterm set the title to user@host:dir. Also copied from Debian.
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Rust/Cargo support.
export PATH="$HOME/.cargo/bin:$PATH"

# RVM setup.
#
# Add RVM to PATH for scripting. NOTE! Make sure this is the last PATH variable change, otherwise RVM will not function correctly.
export PATH="$PATH:$HOME/.rvm/bin"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
