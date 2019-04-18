# -*- bash -*-

# Symlink this to ~/.bash_aliases:
# rm -f ~/.bash_aliases && ln -sf ~/git/dotfiles/bash_aliases ~/.bash_aliases

# Color is nice, and it also makes it easier to distinguish different types
# of files from each other.
alias ls='ls --color=auto'

# Makes grep color the search term when grepping - very helpful.
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'

# This command will loop over all git branches and delete the ones that
# *have been pushed* to the remote. Non-pushed branches will not be
# touched. The `--prune` part at the end will also delete local remote-only
# branches which have been deleted at the remote.
alias prune_branches='git branch -l | grep -v "*" | grep -v upstream-master | xargs git branch -d 2>&1 | grep -v "If you are sure" ; git fetch --all --prune'

alias idea='~/apps/idea-IU-182.3911.36/bin/idea.sh'
alias pbcopy="xclip -sel clip"

# Workaround for Java app that doesn't shutdown cleanly.
# Delay needed to avoid "Address already in use" errors.
alias kill_tomcat='pkill -f tomcat-8.*catalina\.startup'
alias kill_tomcat_dlx='pkill -f tomcat-dlx.*catalina\.startup'
alias start_tomcat='$HOME/java/tomcat-8/bin/startup.sh'
alias restart_tomcat='kill_tomcat ; sleep 1 ; start_tomcat'

alias kill_gradle='pkill -e -f gradle'
alias tail_tomcat_log='tail -n30 -f ~/java/tomcat-8/logs/catalina.out | rainbow -f catalina'
alias less_tomcat_log='less ~/java/tomcat-8/logs/catalina.out'

# Workaround for https://github.com/electron/electron/issues/4380
alias spotify='spotify --disable-gpu'

# We always want to run virsh as root
alias virsh='sudo virsh'

# VisualVM doesn't play well with https://github.com/perlun/perlun-cinnamon-theme,
# so forcing the Metal look-and-feel makes it behave more reasonably.
alias visualvm='visualvm --laf Metal --jdkhome /usr/lib/jvm/java-11-openjdk-amd64'

# Quirk: has to be a function so that "./gw devBuild && restart_tomcat" can work
restart_tomcat() {
    kill_tomcat
    sleep 1
    start_tomcat
}

# Git aliases (technically, functions)
gbranches() {
    git branch --sort=-committerdate --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'
}

gfa() {
    git fetch --all
}

grb() {
    case $1 in
        ''|*[!0-9]*) git rebase $1 ;;
        *) git rebase -i HEAD~$1 ;;
    esac
}

grbc() {
    git rebase --continue
}

grbm() {
    git rebase upstream/master $*
}
