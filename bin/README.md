This folder contains various small "scripts" and other utilities that I find useful. Some are
written in plain C, others are in Ruby, etc.

Symlink this folder like this:

```shell
$ rm -f ~/.dotfiles-bin && ln -s ~/git/dotfiles/bin ~/.dotfiles-bin
```

If you are using [the `profile` from this repo](../profile), the existence of this directory
(`~/dotfiles-bin`) will be picked up automatically, and it will be added to the `$PATH`.
