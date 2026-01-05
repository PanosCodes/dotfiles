# ============================================================================
# MODULAR ZSHRC CONFIGURATION
# ============================================================================
# Configuration is split into logical modules in ~/.zsh/
# This keeps the main .zshrc clean and organized

# Load all configuration modules
for config_file in ~/.zsh/*.zsh; do
  source "$config_file"
done

before_commands() {
  local cmd=$1
  local path_pattern="^spec/.*\.rb*"
  if [[ $cmd =~ $path_pattern ]]; then
    eval "rspec $cmd"
  fi
}

# ============================================================================
# LOCAL OVERRIDES (machine-specific config)
# ============================================================================
# Create ~/.zshrc.local for machine-specific settings that shouldn't be in modules
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
