# To use this from your profile, either copy it to ~/.bash_profile or add a line like this into it 
# (obviously replacing the path to where your cloned copy resides)
# . ~/Work/Source/hg/dotfiles

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Load the Fink initialization, which sets up the path etc. Fink is highly recommended (around 6000 
# packages available). http://sourceforge.net/projects/fink/
test -r /sw/bin/init.sh && . /sw/bin/init.sh

# For whatever reason, my OS X sets this incorrectly making a lot of the localized command line tools 
# display their output in Swedish (even though I've set English as my primary language... sigh. 
# Nevertheless, this fixes that.)
export LANG=${LANG/sv_SE/en_US}

# Add some color to the default prompt. Shamelessly copied from a Debian default profile.
export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

export EDITOR=nano

# I tend to prefer a GNU userland, because it's more flexible in terms of parameters... You can write 
# 'ls /foo/bar -la' for example, whereas you *must* write it as 'ls -la /foo/bar' in the BSD userland, 
# which OS X uses by default.
alias ls='gls --color=auto'
