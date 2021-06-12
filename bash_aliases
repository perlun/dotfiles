# -*- bash -*-

# Symlink this to ~/.bash_aliases:
# rm -f ~/.bash_aliases && ln -sf ~/git/dotfiles/bash_aliases ~/.bash_aliases

# Color is nice, and it also makes it easier to distinguish different types
# of files from each other.
alias ls='ls --color=auto'
alias jq='jq -C'

# Makes grep color the search term when grepping - very helpful.
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'

if [ -x /usr/local/bin/rainbow ]; then
    # Uses Rainbow coloring of ifconfig output, to make it easier to see the IP
    # address(es) configured.
    alias ifconfig='ifconfig | rainbow -f ifconfig'
fi

# This command will loop over all git branches and delete the ones that
# *have been pushed* to the remote. Non-pushed branches will not be
# touched. The `--prune` part at the end will also delete local remote-only
# branches which have been deleted at the remote.
alias prune_branches='git branch -l | grep -v "*" | grep -v upstream-master | xargs git branch -d 2>&1 | grep -v "If you are sure" ; git fetch --all --prune'

alias idea='~/apps/idea-IU-182.3911.36/bin/idea.sh'
alias pbcopy="xclip -sel clip"

alias start_tomcat='$HOME/java/tomcat/bin/startup.sh'

alias kill_gradle='pkill -e -f gradle'
alias tail_tomcat_log='tail -n60 -f ~/java/tomcat/logs/catalina.out | rainbow -f catalina'
alias less_tomcat_log='less ~/java/tomcat/logs/catalina.out'

# Workaround for https://github.com/electron/electron/issues/4380
alias spotify='spotify --disable-gpu'

# We always want to run virsh as root
alias virsh='sudo virsh'

# cd back to the root of a git repository.
alias cdr='cd $(git rev-parse --show-toplevel)'

# Convenience alias to make ack exclude .gitignore'd files
alias gack="git ls-files -oc --exclude-standard | ack -x"

# VisualVM doesn't play well with https://github.com/perlun/perlun-cinnamon-theme,
# so forcing the Metal look-and-feel makes it behave more reasonably.
alias visualvm='visualvm --laf Metal'

# Random number generation
alias random_int32='shuf -i 1-2147483647 -n 1'
alias random_int16='shuf -i 1-65535 -n 1'
alias random_int8='shuf -i 1-255 -n 1'

# Workaround for bug in Xorg. Sometimes, the "use Caps Lock for switching
# keyboard map" doesn't work and sets the Caps Lock state instead. This is used
# as an emergency break, to get rid of Caps Lock in case that happens.
alias CAPSOFF='setcapslock off'

# Convenience alias to be able to get the Tomcat PID for use in e.g.
# 'jstack $(tomcat_pid)'
[ -x /usr/bin/pgrep ] && alias tomcat_pid='pgrep -f "org.apache.catalina.startup.Bootstrap"'

# Make it possible to do things like 'code .' on WSL
[ ! -z "$IS_WSL" ] && alias code='/mnt/c/Users/per/AppData/Local/Programs/Microsoft\ VS\ Code/Code.exe'

# Like the 'pbcopy' alias above, but copies the given .png file to the clipboard
pbcopy_from_png() {
    copyq write image/png - < $1 && copyq select 0
}

create_backup() {
    DATE=$(date +%Y%m%d)
    cp -a $1 $1.bak.${DATE}
}

kill_tomcat() {
    CATALINA_BASE=$HOME/java/tomcat
    $CATALINA_BASE/bin/shutdown.sh 10

    if [ -e $CATALINA_BASE/bin/catalina.pid ]; then
        kill -9 `cat $CATALINA_BASE/bin/catalina.pid`
        rm $CATALINA_BASE/bin/catalina.pid
    fi

    echo "Tomcat stopped"
}

# Quirk: has to be a function so that "./gw devBuild && restart_tomcat" can work
restart_tomcat() {
    kill_tomcat
    sleep 1
    start_tomcat
}

rotate_tomcat_log() {
    mv ~/java/tomcat/logs/catalina.out ~/java/tomcat/logs/catalina-$(date +%s).out
}

# Git aliases (technically, functions)
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
    local _branches=$(git branches --remote)

    if printf '%s' "$_branches" | grep -q upstream/master; then
        git rebase upstream/master $*
    elif printf '%s' "$_branches" | grep -q upstream/main; then
        git rebase upstream/main $*
    else
        git rebase origin/master $*
    fi
}

# 'git revert' to upstream state for a particular file
grv() {
    git checkout upstream/master $*
}

# Poor-man's replacement for https://github.com/jcsalterego/pngpaste
pngpaste() {
    xclip -selection clipboard -t image/png -o > $1
}

prompt_save() {
    export PS2=$PS1
    export PS1='$ '
}

prompt_restore() {
    export PS1=$PS2
    export -n PS2
}

docker_container_id() {
    docker ps -qf name=$1
}

tomcat_container_id() {
    docker_container_id tomcat
}

# Converts 40:b0:76:a3:36:54 to 40-B0-76-A3-36-54 format
mac_to_dashes() {
    echo $1 | sed s/:/-/g | tr a-f A-F
}

# Converts 40-B0-76-A3-36-54 to 40:b0:76:a3:36:54 format
mac_to_colons() {
    echo $1 | sed s/-/:/g | tr A-F a-f
}

# Poor-man's replacement for SDKMAN: https://sdkman.io/
if [[ -d /usr/lib/jvm/adoptopenjdk-8-hotspot-amd64 ]]; then
    java8() {
        sudo update-alternatives --set java /usr/lib/jvm/adoptopenjdk-8-hotspot-amd64/bin/java
        sudo update-alternatives --set javac /usr/lib/jvm/adoptopenjdk-8-hotspot-amd64/bin/javac
    }
fi

if [[ -d /usr/lib/jvm/adoptopenjdk-11-hotspot-amd64 ]]; then
    java11() {
        sudo update-alternatives --set java /usr/lib/jvm/adoptopenjdk-11-hotspot-amd64/bin/java
        sudo update-alternatives --set javac /usr/lib/jvm/adoptopenjdk-11-hotspot-amd64/bin/javac
        sudo update-alternatives --set jshell /usr/lib/jvm/adoptopenjdk-11-hotspot-amd64/bin/jshell
    }
fi

if [[ -d /usr/lib/jvm/adoptopenjdk-14-hotspot-amd64 ]]; then
    java14() {
        sudo update-alternatives --set java /usr/lib/jvm/adoptopenjdk-14-hotspot-amd64/bin/java
        sudo update-alternatives --set javac /usr/lib/jvm/adoptopenjdk-14-hotspot-amd64/bin/javac
        sudo update-alternatives --set jshell /usr/lib/jvm/adoptopenjdk-14-hotspot-amd64/bin/jshell
    }
fi

if [[ -d /usr/lib/jvm/adoptopenjdk-15-hotspot-amd64 ]]; then
    java15() {
        sudo update-alternatives --set java /usr/lib/jvm/adoptopenjdk-15-hotspot-amd64/bin/java
        sudo update-alternatives --set javac /usr/lib/jvm/adoptopenjdk-15-hotspot-amd64/bin/javac
        sudo update-alternatives --set jshell /usr/lib/jvm/adoptopenjdk-15-hotspot-amd64/bin/jshell
    }
fi
