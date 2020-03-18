#
# Custom prompt, inspired by xelabash and others
#

# For a more pleasant command-line git experience.
. $HOME/git/dotfiles/git-prompt.sh

# Add some color to the default prompt. Shamelessly copied from a Debian default profile.
# The __git_ps1 part is important for the git-prompt.sh above to function correctly.
PROMPT_HOST_COLOR=${PROMPT_HOST_COLOR:-1;32}
PROMPT_TIME_COLOR=${PROMPT_TIME_COLOR:-32}

# In addition, if you set GIT_PS1_SHOWDIRTYSTATE to a nonempty value,
# unstaged (*) and staged (+) changes will be shown next to the branch
# name.  You can configure this per-repository with the
# bash.showDirtyState variable, which defaults to true once
# GIT_PS1_SHOWDIRTYSTATE is enabled.
GIT_PS1_SHOWDIRTYSTATE=true

export PS1='\[\e[${PROMPT_TIME_COLOR}m\][\t]\[\e[0m\] \[\e[${PROMPT_HOST_COLOR}m\]\u@\h\[\e[0m\]:\[\e[01;34m\]\w\[\e[0;36m\]$(__git_ps1)'$'\[\e[0m\]\$ '

# If this is an xterm set the title to user@host:dir. Also copied from Debian.
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac
