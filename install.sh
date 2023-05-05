#!/bin/sh

#
# Bash customizations
#
rm -f ~/.profile && ln -sf ~/git/dotfiles/profile ~/.profile

# Gets created by default on e.g. msys2, takes precedence over `~/.profile` so must be deleted.
rm -f ~/.bash_profile

rm -f ~/.bashrc && ln -sf ~/git/dotfiles/bashrc ~/.bashrc
rm -f ~/.bash_aliases && ln -sf ~/git/dotfiles/bash_aliases ~/.bash_aliases

#
# Nano customizations
#
rm -f ~/.nanorc && ln -sf git/dotfiles/nanorc ~/.nanorc

#
# Git customizations
#
if [ ! -f ~/.gitconfig ]; then
  cat >> ~/.gitconfig <<EOF
[include]
        path = ~/git/dotfiles/gitconfig

[user]
        email = perlun@gmail.com
EOF
fi
