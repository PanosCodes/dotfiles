export PATH="/opt/homebrew/bin:$PATH"
export XDG_CONFIG_DIR=$HOME/.config

setopt SHARE_HISTORY
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt HIST_EXPIRE_DUPS_FIRST

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export XDG_CONFIG_HOME=$HOME/.config
export NODE_OPTIONS="--max-old-space-size=8192"

alias cl='clear'
alias lg=lazygit
alias n=nvim
alias z="zellij"
alias za="zellij attach"
alias tapi="zellij --layout  ~/.config/zellij/layouts/tapiful.kdl"
alias f='fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"

touchy() {
  local file_path="$1"

  if [[ -z "$file_path" ]]; then
    echo "Usage: touchy <file_path>"
    return 1
  fi

  # Extract the directory part of the file path
  local dir_path="${file_path%/*}"

  # Create the directory if it doesn't exist
  mkdir -p "$dir_path"

  # Create the file if it doesn't exist
  touch "$file_path"

  echo $file_path
}

# Added by Toolbox App
export PATH="$PATH:/Users/panos/Library/Application Support/JetBrains/Toolbox/scripts"

# Bind the Up Arrow key to search backward in history for commands starting with the current input
bindkey '^[[A' history-search-backward

# Bind the Down Arrow key to search forward in history for commands starting with the current input
bindkey '^[[B' history-search-forward

if [[ "$TERM_PROGRAM" != "vscode" ]]; then
	eval "$(oh-my-posh init zsh --config /users/panos/zash.omp.json)"
	eval "$(zellij setup --generate-auto-start zsh)"
fi

eval "$(/opt/homebrew/bin/mise activate zsh)"
