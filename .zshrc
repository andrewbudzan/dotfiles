# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=2000

setopt append_history           # append
setopt hist_expire_dups_first
setopt hist_ignore_all_dups     # no duplicate
setopt hist_ignore_space      # ignore space prefixed commands
setopt inc_append_history       # add commands as they are typed, don't wait until shell exit 
setopt share_history            # share hist between sessions
setopt extendedglob notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/abudzan/.zshrc'

autoload -Uz compinit && compinit
# End of lines added by compinstall
DISABLE_UNTRACKED_FILES_DIRTY="true"

export ZSH_THEME="ys" # set by `omz`

plugins=(
history
aliases
zsh-syntax-highlighting
timer
vi-mode
systemadmin
)

# vi-mode mode indication
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VI_MODE_SET_CURSOR=true
MODE_INDICATOR="%F{yellow}--normal--%f"
INSERT_MODE_INDICATOR="%F{green}--insert--%f"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="ys" # set by `omz`

# User configuration
export MANPATH="/usr/local/man:$MANPATH"

# Execution timer options
export TIMER_FORMAT=':%d'
export TIMER_PRECISION=3 

# Don't show default promt when working in virtualenvironment 
export VIRTUAL_ENV_DISABLE_PROMPT=1

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

source $ZSH/oh-my-zsh.sh

# Example aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias da="deactivate"
alias reload="source ~/.zshrc"
alias colors='for code in {0..255}; do echo -e "\e[38;05;${code}m $code: test"; done'

