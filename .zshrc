# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Initialize prompt
autoload -Uz promptinit
promptinit
prompt powerlevel10k


# Customize to your needs...

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# Git completion ----------------------->>
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)

autoload -U compinit
compinit -u
# <<-- Git Completion --------------------


# Enable syntax highlight
source $HOMEBREW_ROOT/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Load nodenv
eval "$(nodenv init -)"

alias g=git
alias ll="exa -l -h -@ -m --icons --git --time-style=long-iso --color=automatic --group-directories-first"
alias l="ll -aa"
