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
