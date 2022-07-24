#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR='vi'
export SUDO_EDITOR="vi"
export VISUAL='vi'
export PAGER='less'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='ja_JP.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $path
)

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

#
# Check OS type
#
if [ "$(uname)" = 'Darwin' ]; then
  export OS_TYPE='Mac'
  export HOMEBREW_ROOT='/opt/homebrew'
elif [ "$(expr substr $(uname -s) 1 5)" = 'Linux' ]; then
  export OS_TYPE='Linux'
  export HOMEBREW_ROOT='/home/linuxbrew/.linuxbrew'
elif [ "$(expr substr $(uname -s) 1 10)" = 'MINGW32_NT' ]; then
  export OS_TYPE='Cygwin'
  export HOMEBREW_ROOT='/home/linuxbrew/.linuxbrew'
else
  echo "Unknown operation system..." >&2
  export OS_TYPE='Unknown'
  export HOMEBREW_ROOT=''
fi

#
# Other environments
#
eval $($HOMEBREW_ROOT/bin/brew shellenv)

export PATH="$HOME/bin:$PATH"
export PATH="$HOMEBREW_ROOT/opt/openjdk/bin:$PATH"
export PATH="$HOME/.nodenv/shims:$PATH"

export CPPFLAGS="-I$HOMEBREW_ROOT/opt/openjdk/include"

export EXA_COLORS="da=36"
export BAT_CONFIG_PATH="$HOME/.config/bat/config"

