# Symlink this to ~/.bash_aliases:
# rm -f ~/.bash_aliases && ln -sf ~/git/dotfiles/bash_aliases ~/.bash_aliases

# Color is nice, and it also makes it easier to distinguish different types of files from each other.
alias ls='ls --color=auto'

# This command will loop over all git branches and delete the ones that *have been pushed* to the remote. Non-pushed branches will
# not be touched. The `--prune` part at the end will also delete local remote-only branches which have been deleted at the reomte.
alias prune_branches='git branch -l | xargs git branch -d ; git fetch --prune'

# We don't start PostgreSQL on system startup, but only on demand.
alias postgres96='pg_ctl -D /usr/local/var/postgresql@9.6 start'
