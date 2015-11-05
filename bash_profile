# To use this from your profile, either copy it to ~/.bash_profile or add a line like this into it 
# (obviously replacing the path to where your cloned copy resides)
# . ~/Work/Source/hg/dotfiles

source $HOME/git/dotfiles/git-prompt.sh

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# For whatever reason, my OS X sets this incorrectly making a lot of the localized command line tools 
# display their output in Swedish (even though I've set English as my primary language... sigh. 
# Nevertheless, this fixes that.)
export LANG=${LANG/sv_SE/en_US}

# Add some color to the default prompt. Shamelessly copied from a Debian default profile.
export PS1='\033[32m[\t]\033[0m \[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\033[36m$(__git_ps1)\033[0m\n\$ '

export UNCRUSTIFY_CONFIG=~/hg/dotfiles/uncrustify.cfg

# If this is an xterm set the title to user@host:dir. Also copied from Debian.
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

export EDITOR=nano
export PYTHONPATH=$BREW_PREFIX/lib/python2.7/site-packages:$PYTHONPATH
export PATH=$PATH:~/bin:~/git/uxfactory.bin:/usr/local/mongodb/bin

# I tend to prefer a GNU userland, because it's more flexible in terms of parameters... You can write 
# 'ls /foo/bar -la' for example, whereas you *must* write it as 'ls -la /foo/bar' in the BSD userland, 
# which OS X uses by default.
alias ls='gls --color=auto'
alias chown=gchown
alias reload='curl -4 http://localhost:42000/_reload'

set +H

umask 0002

sublime()
{
  open $1 -a "Sublime Text 2"
}

fix_src()
{
  TEMPFILE=`tempfile`
  recomment $1 $TEMPFILE
  mv $TEMPFILE $1

  uncrustify --replace $1
}
