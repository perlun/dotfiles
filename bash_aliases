# Symlink this to ~/.bash_aliases:
# rm -f ~/.bash_aliases && ln -sf ~/git/dotfiles/bash_aliases ~/.bash_aliases

# Color is nice, and it also makes it easier to distinguish different types of files from each other.
alias ls='ls --color=auto'

# This command will loop over all git branches and delete the ones that *have been pushed* to the remote. Non-pushed branches will
# not be touched. The `--prune` part at the end will also delete local remote-only branches which have been deleted at the reomte.
alias prune_branches='git branch -l | xargs git branch -d ; git fetch --prune'

# We don't start these services on system startup, but only run it in the foreground on demand.
alias postgres96='/usr/local/Cellar/postgresql@9.6/9.6.6/bin/postgres -D /usr/local/var/postgresql@9.6'
alias redis='redis-server /usr/local/etc/redis.conf'

alias yard_server='bundle exec yard server --reload'

# I use Java 10 by default, but some applications only work correctly on Java 8/9.
alias java8='unset JAVA_OPTS; export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)'
alias java9='export JAVA_HOME=$(/usr/libexec/java_home -v 9); set_java_opts'
alias java10='export JAVA_HOME=$(/usr/libexec/java_home -v 10); set_java_opts'
