export PATH="/usr/local/sbin:$PATH"
export EDITOR=nvim

# uncomment to run zprof
# zmodload zsh/prof

# history
HISTSIZE=50000
SAVEHIST=10000

# load the rest of the configs
source $HOME/bootstrap/zsh/.exports
source $HOME/bootstrap/zsh/.aliases
source $HOME/bootstrap/zsh/.functions.zsh
source $HOME/bootstrap/zsh/.starship.zsh
source $HOME/bootstrap/zsh/.k8s_aliases

export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"

# load Starship
eval "$(starship init zsh)"
