# Symlink this to ~/.bash_aliases:
# rm -f ~/.bash_aliases && ln -sf ~/git/dotfiles/bash_aliases ~/.bash_aliases

# Color is nice, and it also makes it easier to distinguish different types
# of files from each other.
alias ls='ls --color=auto'

# This command will loop over all git branches and delete the ones that
# *have been pushed* to the remote. Non-pushed branches will not be
# touched. The `--prune` part at the end will also delete local remote-only
# branches which have been deleted at the remote.
alias prune_branches='git branch -l | grep -v "*" | xargs git branch -d 2>&1 | grep -v "If you are sure" ; git fetch --prune'

alias idea='~/apps/idea-IU-182.3911.36/bin/idea.sh'
alias pbcopy="xclip -sel clip"

# Workaround for Java app that doesn't shutdown cleanly.
# Delay needed to avoid "Address already in use" errors.
alias kill_tomcat='pkill -f tomcat-8.*catalina\.startup'
alias kill_tomcat_dlx='pkill -f tomcat-dlx.*catalina\.startup'
alias restart_tomcat='kill_tomcat ; sleep 1 ; $HOME/java/tomcat-8/bin/startup.sh'
alias restart_tomcat_dlx='kill_tomcat_dlx ; sleep 1 ; $HOME/java/tomcat-dlx/bin/startup.sh'

alias kill_gradle='pkill -e -f gradle'
alias tail_tomcat_log='tail -f ~/java/tomcat-8/logs/catalina.out'

# Workaround for https://github.com/electron/electron/issues/4380
alias spotify='spotify --disable-gpu'
