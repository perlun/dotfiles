# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.

# Symlink this to ~/.profile:
# rm -f ~/.profile && ln -sf ~/git/dotfiles/profile ~/.profile
#
# Note: do NOT place secrets in this file, since it is public on GitHub. Place them in the file below:
[ -f ~/.profile_secrets ] && . ~/.profile_secrets

# If running bash, we include .bashrc if it exists.
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# Branch/etc completion in git.
# To get this working on macOS: brew install bash-completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# For a more pleasant command-line git experience.
. $HOME/git/dotfiles/git-prompt.sh

# Add some color to the default prompt. Shamelessly copied from a Debian default profile.
# The __git_ps1 part is important for the git-prompt.sh above to function correctly.
PROMPT_HOST_COLOR=${PROMPT_HOST_COLOR:-1;32}
PROMPT_TIME_COLOR=${PROMPT_TIME_COLOR:-32}
export PS1='\033[${PROMPT_TIME_COLOR}m[\t]\033[0m \[\033[${PROMPT_HOST_COLOR}m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\033[36m$(__git_ps1)'$'\033[0m\n\$ '

# If this is an xterm set the title to user@host:dir. Also copied from Debian.
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# History expansion is enabled by default. It causes problems when your git commit messages contains exclamation marks, like this:
#
#     git commit foo.txt -m "I had to change this! Really?"
#
# Therefore, I prefer to disable history expansion.
set +H

# Various ENV variable settings
export EDITOR='code -w'

# This is needed to avoid warnings with JRuby on Java 9+.
export JAVA_OPTS='--add-opens java.base/java.util.zip=ALL-UNNAMED --add-opens java.base/java.security.cert=ALL-UNNAMED --add-opens java.base/java.security=ALL-UNNAMED --add-opens java.base/java.io=ALL-UNNAMED'

# Rust/Cargo support.
export PATH="$HOME/.cargo/bin:$PATH"

# OCaml/opam support
. ~/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

if [ -d /usr/local/opt/postgresql@9.6 ] ; then
  export PATH=$PATH:/usr/local/opt/postgresql@9.6/bin
fi

has_homebrew() {
  if [ $(which brew 2> /dev/null | wc -l ) -gt 0 ] ; then
    return 0
  fi

  return 1
}

# We prefer the GNU versions of these command line tools, when available, for the following reasons:
#
# - They are less picky in terms of order of arguments. On BSD/macOS,`chown . -R` doesn't work for example. The GNU versions are
#   more forgiving and relaxed in this regard.
# - They are simpler to use. Sometimes the BSD versions require more parameters. You are require to write `find .`, but GNU find
#   will default to the current working directory if no parameter is provided.
#
# Simply put: if you are used to the GNU userland, going to a BSD userland is a pain. The setting below makes it less so.

if has_homebrew ; then
  export PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/findutils/libexec/gnubin:/usr/local/opt/curl/bin:$PATH"
fi

# RVM setup.
#
# Add RVM to PATH for scripting. NOTE! Make sure this is the last PATH variable change, otherwise RVM will not function correctly.
export PATH="$PATH:$HOME/.rvm/bin"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
