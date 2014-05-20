# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

source .zsh-includes/setup.zsh
source .zsh-includes/completion.zsh
source .zsh-includes/setopt.zsh
source .zsh-includes/bindkeys.zsh
source .zsh-includes/aliases.zsh
source .zsh-includes/history.zsh
source .zsh-includes/exports.zsh
source .zsh-includes/functions.zsh
source .zsh-includes/theme.zsh

if [[ $IS_MAC -eq 1 ]]; then
  source .zsh-includes/mac.zsh
fi

plugins=(osx brew git git-flow github node npm mercurial)

source $ZSH/oh-my-zsh.sh
