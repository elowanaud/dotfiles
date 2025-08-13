# Setup Zinit (plugin manager)
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Install Zinit if it doesn't exist
if [ ! -d $ZINIT_HOME ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Load Zinit
source "${ZINIT_HOME}/zinit.zsh"

# Load Zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light g-plane/pnpm-shell-completion
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::docker
zinit snippet OMZP::git-auto-fetch
autoload -Uz compinit && compinit
zinit ice atload"zpcdreplay" atclone"./zplug.zsh" atpull"%atclone"



# Load OhMyPosh
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/config.toml)"
fi

# Load Node Version Manager
eval "$(fnm env --use-on-cd --shell zsh)"
eval "$(fnm completions --shell zsh)"

# Load Ruby Version Manager
eval "$(rbenv init - --no-rehash zsh)"

# Configure Zsh autocompletion
HISTSIZE=50000
HISTFILE="$HOME/.zsh_history"
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'
alias update='\
  zinit self-update && \
  zinit update --all && \
  zinit delete --clean && \
  brew update && \
  brew upgrade && \
  brew cleanup
'
alias c='cursor'
alias p='pnpm'