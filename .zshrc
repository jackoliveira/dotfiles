export ZSH="$HOME/.oh-my-zsh"
plugins=(git)

ZSH_THEME="cloud"

# Source
source $ZSH/oh-my-zsh.sh
source $HOME/.bash_aliases

# ZSH_THEME_RANDOM_CANDIDATES=(
# "robbyrussell"
# "agnoster"
# "pygmalion"
# "afowler"
# "cloud"
# "lambda"
# )

setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

# Export variables

# Utils Gringo

export PATH=$PATH:$HOME/.flashlight/bin
export PATH=$PATH:$HOME/.maestro/bin
export PATH=$PATH:$HOME/.temporalio/bin
export PATH=$PATH:$HOME/.local/bin/

# Java/Android
export PATH=$PATH:$JAVA_HOME/bin
export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_SDK_ROOT=$HOME/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

export EDITOR=nvim

if ! [ -f $HOME/.tmuxifier/bin ]; then
  export PATH="$HOME/.tmuxifier/bin:$PATH"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Key bindings
bindkey -s "\C-f" "cd && cd \$(find * -maxdepth 2 -not -path "node_modules" -type d | fzf-tmux)^M" # CTRL+F

neofetch

