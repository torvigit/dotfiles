# ----------------------------
# Basic shell behavior
# ----------------------------

ZSH_THEME="robbyrussell"
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

export EDITOR=nvim
export VISUAL=nvim
export PAGER=bat
export LESS="-R"
export DOTFILES_DIR="~/dotfiles/"

setopt AUTO_CD
setopt CORRECT
setopt INTERACTIVE_COMMENTS
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# ----------------------------
# Completion
# ----------------------------

autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# ----------------------------
# Plugins
# ----------------------------

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
plugins=(git)

# ----------------------------
# fzf integration
# ----------------------------

[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh

# ----------------------------
# Aliases
# ----------------------------

alias ls="eza --icons --group-directories-first"
alias ll="eza -lh --icons"
alias la="eza -lha --icons"
alias cat="bat --style=plain"

alias g="git"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gca="git commit -a"
alias gp="git push"
alias gl="git pull"
alias gd="git diff"
alias gco="git checkout"
alias gg="lazygit"

alias nv="nvim"

alias dcu="docker compose up"
alias dcd="docker compose down"
alias dcub="docker compose up --build"
alias dg="lazydocker"

alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

alias rzsh="source ~/.zshrc"
alias zshconf="nvim ~/.zshrc"
alias editconf="nvim ~/.config/"
alias editdot="nvim $DOTFILES_DIR"

# ----------------------------
# Arch
# ----------------------------
alias pku="sudo pacman -Sy"
alias pki="sudo pacman -S --needed --noconfirm"
alias sysupgrade="sudo pacman -Syu"

# ----------------------------
# Path additions
# ----------------------------

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"

# ----------------------------
# Java
# ----------------------------

export JAVA_HOME=/usr/lib/jvm/default
export PATH="$JAVA_HOME/bin:$PATH"

# ----------------------------
# Prompt
# ----------------------------

autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b'

PROMPT='%F{blue}%n@%m%f %F{cyan}%~%f %F{magenta}${vcs_info_msg_0_}%f %# '

# ----------------------------
# Starship
# ----------------------------

eval "$(starship init zsh)"
