export PATH="/opt/homebrew/bin:$PATH"

setopt SHARE_HISTORY
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt HIST_EXPIRE_DUPS_FIRST

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

alias cl=clear
alias lg=lazygit
alias n=nvim

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


# Added by Toolbox App
export PATH="$PATH:/Users/panos/Library/Application Support/JetBrains/Toolbox/scripts"

# Bind the Up Arrow key to search backward in history for commands starting with the current input
bindkey '^[[A' history-search-backward

# Bind the Down Arrow key to search forward in history for commands starting with the current input
bindkey '^[[B' history-search-forward


# Added by `rbenv init` on Sat Dec 14 10:01:36 EET 2024
eval "$(rbenv init - --no-rehash zsh)"

if [[ "$TERM_PROGRAM" != "vscode" ]]; then
	eval "$(oh-my-posh init zsh --config /users/panos/zash.omp.json)"
	eval "$(zellij setup --generate-auto-start zsh)"
fi

eval "$(/opt/homebrew/bin/mise activate zsh)"
