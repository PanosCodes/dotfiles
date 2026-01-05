# Create file and parent directories in one command
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

# Function to list branches and checkout selected one using fzf
b() {
  local selection branch

  # Get current branch
  local current_branch=$(git branch --show-current 2>/dev/null)

  # List all local branches with formatting
  selection=$(git branch --format='%(refname:short)' 2>/dev/null | awk -v curr="$current_branch" '
    {
      if ($1 == curr) {
        printf "\033[1;32m%s\033[0m \033[0;33m← current\033[0m\n", $1
      } else {
        printf "\033[1;36m%s\033[0m\n", $1
      }
    }
  ' | fzf --prompt="🌿 Select branch: " --ansi --height=60% --border --preview="git log --oneline --graph --color=always {1} -- | head -20" --preview-window=right:50%)

  if [[ -n $selection ]]; then
    # Extract branch name (remove any ANSI codes and "← current" marker)
    branch=$(echo "$selection" | sed 's/\x1b\[[0-9;]*m//g' | awk '{print $1}')

    if [[ "$branch" == "$current_branch" ]]; then
      echo "Already on branch '$branch'"
    else
      git checkout "$branch" || echo "Failed to checkout branch '$branch'"
    fi
  else
    echo "No branch selected."
  fi
}

unalias nfr 2>/dev/null
nfr() {
  if [ -z "$1" ]; then
    echo "Usage: nfr <remote-branch-name>"
    return 1
  fi

  branch=$(echo "$1" | awk '{print $1}')  # handles extra spaces

  echo "Fetching origin..."
  git fetch origin
  git switch -c "$branch" --track "origin/$branch"
}
