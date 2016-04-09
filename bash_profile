# To use this from your profile, either copy it to ~/.bash_profile or add a line like this into it
# (obviously replacing the path to where your cloned copy resides)
# . ~/git/dotfiles

has_homebrew() {
  if [ $(which brew | wc -l ) -gt 0 ] ; then
    return 0
  fi

  return 1
}

if [ -f ~/git/ecraft/bep-chef/site-cookbooks/ecraft-users/files/etc/profile.d/bash-docker-aliases.sh  ] ; then
  echo "loading bash-docker-aliases.sh"
  . ~/git/ecraft/bep-chef/site-cookbooks/ecraft-users/files/etc/profile.d/bash-docker-aliases.sh
fi

if has_homebrew ; then
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi
fi

source $HOME/git/dotfiles/git-prompt.sh

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# For whatever reason, my OS X sets this incorrectly making a lot of the localized command line tools
# display their output in Swedish (even though I've set English as my primary language... sigh.
# Nevertheless, this fixes that.)
export LANG=${LANG/sv_SE/en_US}

# Add some color to the default prompt. Shamelessly copied from a Debian default profile.
PROMPT_HOST_COLOR=${PROMPT_HOST_COLOR:-1;32}
export PS1='\033[32m[\t]\033[0m \[\033[${PROMPT_HOST_COLOR}m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\033[36m$(__git_ps1)\033[0m\n\$ '

export UNCRUSTIFY_CONFIG=~/hg/dotfiles/uncrustify.cfg

# If this is an xterm set the title to user@host:dir. Also copied from Debian.
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

if has_homebrew ; then
  export NVM_DIR=~/.nvm
  . $(brew --prefix nvm)/nvm.sh
fi

export EDITOR=nano
export JRUBY_OPTS="-Xcompile.invokedynamic=false -J-XX:+TieredCompilation -J-XX:TieredStopAtLevel=1 -J-noverify -Xcompile.mode=OFF"
export PYTHONPATH=$BREW_PREFIX/lib/python2.7/site-packages:$PYTHONPATH
export PATH=$PATH:~/bin:~/git/ecraft/ecraft.uxfactory.bin:/usr/local/mongodb/bin
export UXFACTORY_LICENSE_FILE="~/Dropbox/Tre Kronor/Licenses/eCraft Developer Licenses/Per.Lundberg.-.eCraft.appfactory.license"
export PYTHONWARNINGS="ignore:Unverified HTTPS request"

if [ $(which docker-machine | wc -l ) -gt 0 ] ; then
  eval $(docker-machine env ecraft-bep)
fi

if [ $(which gls | wc -l ) -gt 0 ] ; then
  # OS X with GNU userland detected. I tend to prefer this because it's more flexible in terms of parameters... You can write
  # 'ls /foo/bar -la' for example, whereas you *must* write it as 'ls -la /foo/bar' in the BSD userland, which OS X uses by default.
  alias ls='gls --color=auto'
  alias chown=gchown
  alias find=gfind
else
  alias ls='ls --color=auto'
fi

alias reload='curl -4 http://localhost:42000/_reload'
alias flushdns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'

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

mmv() {
  mkdir -p $2 && mv $1 $2
}
