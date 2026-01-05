# Only run oh-my-posh and zellij outside of VS Code and JetBrains terminals
if [[ "$TERM_PROGRAM" != "vscode" && "$TERMINAL_EMULATOR" != "JetBrains-JediTerm" ]]; then
	eval "$(oh-my-posh init zsh --config /users/panos/zash.omp.json)"
	eval "$(zellij setup --generate-auto-start zsh)"
fi
