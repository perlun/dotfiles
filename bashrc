# ~/.bashrc: executed by bash(1) for non-login shells.

# Symlink this to ~/.bashrc:
# rm -f ~/.bashrc && ln -sf ~/git/dotfiles/bashrc ~/.bashrc
#
# Note: do NOT place secrets in this file, since it is public on GitHub.

# Alias definitions. Shamelessly borrowed from the Debian default setup.
#
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_secrets ]; then
    . ~/.bash_secrets
fi

[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion


[[ -d "$HOME/.nvm" ]] && export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[[ -d "$HOME/.yarn/bin" ]] && export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Check if starship is installed, and if it is, enable it. If not, fall back to
# a standard Debian-inspired prompt.
command -v starship &> /dev/null && {
    export STARSHIP_CONFIG=~/git/dotfiles/starship.toml
    eval "$(starship init bash)"
} || {
    # Enable a colored prompt. Borrowed from /etc/skel/.bashrc in Debian.
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

    # If this is an xterm set the title to user@host:dir. Also copied from Debian.
    case "$TERM" in
        xterm*|rxvt*)
        PS1="\[\e]0;\u@\h: \w\a\]$PS1"
        ;;
    *)
        ;;
    esac
}
