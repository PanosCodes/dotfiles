export PATH="/opt/homebrew/bin:$PATH"
export XDG_CONFIG_DIR=$HOME/.config
export XDG_CONFIG_HOME=$HOME/.config

export DISABLE_SPRING=true

# Node.js
export NODE_OPTIONS="--max-old-space-size=8192"

# Android SDK
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Go
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"

# JetBrains Toolbox
export PATH="$PATH:/Users/panos/Library/Application Support/JetBrains/Toolbox/scripts"

export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export PUPPETEER_EXECUTABLE_PATH=/opt/homebrew/bin/chromium

# opencode
export PATH=/Users/panos/.opencode/bin:$PATH
