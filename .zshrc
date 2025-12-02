# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

#source /home/linuxbrew/.linuxbrew/opt/powerlevel10k/powerlevel10k.zsh-theme
source /home/linuxbrew/.linuxbrew/Cellar/powerlevel10k/1.20.0/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Editor setting
export EDITOR=vim

# Enable asdf
. /home/linuxbrew/.linuxbrew/opt/asdf/libexec/asdf.sh

# git-completion
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)

autoload -U compinit
compinit -u

# zsh syntax highlighting
source /home/linuxbrew/.linuxbrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh completions
if type brew &>/dev/null; then
  FPATH=/home/linuxbrew/.linuxbrew/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

# Cleanup old .zcompdump chaches
for dump in ~/.zcompdump(N-.); do
  [[ $dump != ~/.zcompdump ]] && rm -f $dump
done

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


# Android SDK on Windows
export ANDROID_HOME=/mnt/c/Users/w-oyama/AppData/Local/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools
export WSLENV=$WSLENV:ANDROID_HOME/p


# aliases
alias g=git
alias ll="eza -l -h -F -m -U -g --icons --git --time-style=long-iso --color=automatic --group-directories-first"
alias l="ll -aa"
alias dc="docker compose"
alias lg="lazygit"
alias svg2png="rsvg-convert --keep-aspect-ratio"


# export PATHs (Safety-path only)
export PATH=$PATH:/mnt/c/Program\ Files/Microsoft\ VS\ Code/bin
export COLORTERM=truecolor

# include other files
[[ ! -f ~/.config/zsh/.secrets.zsh ]] || source ~/.config/zsh/.secrets.zsh

# binding like emacs
bindkey -e


# ====== Antigravity Launcher Config ======
export PATH="$HOME/.local/bin:$PATH"
# ====== End of Antigravity Launcher Config ======
