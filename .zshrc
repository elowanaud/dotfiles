# Setup Zinit (plugin manager)
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Load Zsh plugins
zinit light zsh-users/zsh-syntax-highlighting

# Load OhMyZsh snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git

# # Aliases
alias ls='ls --color'

# Load Node Version Manager
eval "$(fnm env --use-on-cd --shell zsh)"

# Load Ruby Version Manager
eval "$(rbenv init - --no-rehash zsh)"