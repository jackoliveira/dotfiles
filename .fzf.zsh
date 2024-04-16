# Setup fzf
# ---------
if [[ ! "$PATH" == */home/jack/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/jack/.fzf/bin"
fi

# Auto-completion
# ---------------
source "/home/jack/.fzf/shell/completion.zsh"

# Key bindings
# ------------
source "/home/jack/.fzf/shell/key-bindings.zsh"
