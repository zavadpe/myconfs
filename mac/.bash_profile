export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

function git_info() {
    # check if we're in a git repo
    git rev-parse --is-inside-work-tree &>/dev/null || return

    # quickest check for what branch we're on
    branch=$(git symbolic-ref -q HEAD | sed -e 's|^refs/heads/||')

    echo $WHITE"*"$PURPLE$UNDERLINE$branch$RESET
}

function prompt {
  local BLACK="\[\033[0;30m\]"
  local BLACKBOLD="\[\033[1;30m\]"
  local RED="\[\033[0;31m\]"
  local REDBOLD="\[\033[1;31m\]"
  local GREEN="\[\033[0;32m\]"
  local GREENBOLD="\[\033[1;32m\]"
  local YELLOW="\[\033[0;33m\]"
  local YELLOWBOLD="\[\033[1;33m\]"
  local BLUE="\[\033[0;34m\]"
  local BLUEBOLD="\[\033[1;34m\]"
  local PURPLE="\[\033[0;35m\]"
  local PURPLEBOLD="\[\033[1;35m\]"
  local CYAN="\[\033[0;36m\]"
  local CYANBOLD="\[\033[1;36m\]"
  local WHITE="\[\033[0;37m\]"
  local WHITEBOLD="\[\033[1;37m\]"
  local RESETCOLOR="\[\e[00m\]"

  export PS1="\n$RED\u $PURPLE@ $GREEN\w $RESETCOLOR$GREENBOLD\$(git_info)\n$BLUE $ $RESETCOLOR"
  export PS2=" | → $RESETCOLOR"
}

prompt

alias ll='ls -alF'
alias la='ls -alh'
alias mc='LANG=en_EN.UTF-8 mc'

export DEV=$HOME/Dev
export PROJECTS=$DEV/projects
export ANDROID=$HOME/Library/Android
export ANDROID_SDK=$ANDROID/sdk
export ANDROID_NDK=$ANDROID_SDK/ndk-bundle
export ANDROID_HOME=$ANDROID_SDK
export ANDROID_NDK_ROOT=$ANDROID_NDK
export ANDROID_TOOLS=$ANDROID_SDK/tools
export ANDROID_PLATFORM_TOOLS=$ANDROID_SDK/platform-tools

export JAVA_HOME=$(/usr/libexec/java_home)

alias cdd='cd $DEV'
alias cdh='cd $HOME'
alias cdp='cd $PROJECTS'
alias adbshake='adb shell input keyevent 82'

export POSTGRES=/Applications/Postgres.app/Contents/Versions/9.6/bin

export PATH="/usr/local/bin:$ANDROID_TOOLS:$ANDROID_PLATFORM_TOOLS:$HOME/.rbenv/bin:$POSTGRES:$PATH"

eval "$(rbenv init -)"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
