# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.

# Symlink this to ~/.profile:
# rm -f ~/.profile && ln -sf ~/git/dotfiles/profile ~/.profile
#
# Note: do NOT place secrets in this file, since it is public on GitHub. Place them in the file below:
[ -f $HOME/.profile_secrets ] && . $HOME/.profile_secrets

# If running bash, we include .bashrc if it exists.
if [ -n "$BASH_VERSION" ]; then
   if [ -f "$HOME/.bashrc" ]; then
       . "$HOME/.bashrc"
   fi
fi

# Enable seamless decompression of .gzip files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Branch/etc completion in git.
# To get this working on macOS: brew install bash-completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# Bash completion for the Fastly CLI, if installed:
# https://github.com/fastly/cli
[ -x /usr/local/bin/fastly ] && eval "$(fastly --completion-script-bash)"

# Set a custom prompt
. $HOME/git/dotfiles/prompt.sh

# History expansion is enabled by default. It causes problems when your git commit messages contains exclamation marks, like this:
#
#     git commit foo.txt -m "I had to change this! Really?"
#
# Therefore, I prefer to disable history expansion.
set +H

# Avoid closing the shell by accident, if running in a local terminal
if [[ -z "$SSH_CONNECTION" ]]; then
    set -o ignoreeof
fi

# Various ENV variable settings
export EDITOR=nano
export LESS=-R

# This is important to get `git blame` timestamps to use yyyy-MM-dd format in IntelliJ.
if cat /etc/locale.gen | grep -q '^sv_SE.UTF-8' ; then
    export LC_TIME=sv_SE.UTF-8
fi

# Superuser binaries (like ifconfig) are useful even when running as an
# unprivileged user.
export PATH="$PATH:/sbin:/usr/sbin"

# Rust/Cargo support.
[[ -d "$HOME/.cargo/bin" ]] && export PATH="$HOME/.cargo/bin:$PATH"

# Go support
[[ -d "$HOME/go/bin" ]] && export PATH="$PATH:$HOME/go/bin"
[[ -d /usr/lib/go-1.12/bin ]] && export PATH="$PATH:/usr/lib/go-1.12/bin"

# .NET Core support
[[ -d "$HOME/dotnet" ]] && export DOTNET_ROOT=$HOME/dotnet
[[ -d "$HOME/dotnet" ]] && export PATH=$PATH:$HOME/dotnet

# Python support
[[ -d "$HOME/.local/bin" ]] && export PATH=$PATH:$HOME/.local/bin

# Perlang support
[[ -d "$HOME/.perlang/nightly/bin" ]] && export PATH=$PATH:$HOME/.perlang/nightly/bin

# Misc binaries
[[ -d "$HOME/bin" ]] && export PATH="$HOME/bin:$PATH"

# Binaries and scripts from this repo
[[ -d "$HOME/.dotfiles-bin" ]] && export PATH="$HOME/.dotfiles-bin:$PATH"

# RVM setup.
#
# Add RVM to PATH for scripting. NOTE! Make sure this is the last PATH variable change, otherwise RVM will not function correctly.
[[ -d "$HOME/.rvm/bin" ]] && export PATH="$PATH:$HOME/.rvm/bin"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# virtualenvwrapper support
[[ -s /usr/share/virtualenvwrapper/virtualenvwrapper.sh ]] && source /usr/share/virtualenvwrapper/virtualenvwrapper.sh

#
# Convenience functions for being able to use the local gradle wrapper
# easily from anywhere within the source tree.
#
find_up() {
    path="$PWD"

    while [[ $path != / ]];
    do
        find "$path" -maxdepth 1 -mindepth 1 "$@"
        path="$(readlink -f "$path"/..)"
    done
}

#
# Bash completion for the gradle wrapper
#
gwComplete() {
    local tasks=$(grep "^task " build.gradle | awk '{ print $2 }' | tr -d '(' | xargs)
    local cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=( $(compgen -W "${tasks}" -- ${cur}) )
}

#
# Run the gradle wrapper, either from the current directory if present or
# in the closest parent folder.
#
gw() {
    if [[ -x gradlew ]]; then
        ./gradlew "$@"
    else
        GW_PATH=$(find_up -name gradlew|head -n 1)
        if [[ $? -eq 0 ]] && [[ "$GW_PATH" != "" ]] && [[ -x "$GW_PATH" ]]; then
            $GW_PATH "$@"
        else
            echo "ERROR: no executable gradlew found in any parent directory"
        fi
    fi
}

#
# Associate the gwComplete function as the completion function for gw
#
complete -F gwComplete gw
