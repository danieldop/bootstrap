export PATH="/usr/local/sbin:$PATH"
export EDITOR=nvim

# uncomment to run zprof
# zmodload zsh/prof

# history
HISTSIZE=50000
SAVEHIST=10000

source ~/antigen.zsh

antigen bundles <<EOBUNDLES
    tmux
    command-not-found

    zsh-users/zsh-autosuggestions
    zsh-users/zsh-completions
    djui/alias-tips
    zsh-users/zsh-syntax-highlighting
EOBUNDLES
antigen apply

# load the rest of the configs
source $HOME/bootstrap/zsh/.exports
source $HOME/bootstrap/zsh/.aliases
source $HOME/bootstrap/zsh/.k8s_aliases
source $HOME/bootstrap/zsh/.kubectl_prompt
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
