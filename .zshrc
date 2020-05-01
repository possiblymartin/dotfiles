# Dank 
PROMPT="%n %F{202}:%f%F{202}:%f %F{148}%~%f %F{202}%?%f %F{53}»%f "

# Aliases
alias grep='grep --color=auto'
alias :q='exit'

# Python 3 pleaseee
alias python='/usr/bin/env python3'

# Work
alias sshweb='ssh -i ~/.ssh/google_compute_engine martinkirilov@35.234.148.115'

# React Native
alias iosrun='npx react-native run-ios'
alias androidrun='npx react-native run-android'


# Colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxCxegedabagacad
export TERM=screen-256color

# For the gods
export EDITOR='/usr/bin/vim'

# Go path
export PATH=${PATH}:/usr/local/go/bin
export GOPATH=~

# Paths
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
