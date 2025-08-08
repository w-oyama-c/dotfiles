#!/bin/bash

# ⚠️zshでは挙動が変わってしまったためbashとして実行させる

# vim: set ft=zsh ff=unix fenc=utf8 enc=utf8 expandtab ts=2 sw=2 :

### functions ######################################################################################

function echo_current_dir() {
  # カレントディレクトリのパスを取得
  current_dir=$(pwd)

  # パスをディレクトリの区切り文字("/")で分割
  IFS='/' read -ra dir_parts <<< "$current_dir"

  # 最後の要素を取得
  dir="${dir_parts[-1]}"

  # 結果を表示
  echo -e $(printf "\e[32mFetching %s ...\e[0m" "$dir")
}



### main scripts ###################################################################################

files="/usr/local/src/github/carseven-development/*"

echo -e "\e[32mBegin git-fetch to all cloned repositories.\e[0m"
echo

for filepath in $files; do
  echo $filepath
  if [ -d $filepath ] ; then
    cd $filepath

    echo_current_dir

    git fetch --all --append --prune
    git gc

    if ! git config --local user.name >/dev/null; then
      git config --local user.name "w-oyama-c"
      echo "Setting git user.name: "`git config --local user.name`
    fi
    if ! git config --local user.email >/dev/null; then
      git config --local user.email "w-oyama@carseven.jp"
      echo "Setting git user.email: "`git config --local user.email`
    fi

    if [ "$(git config --local core.filemode)" = "true" ]; then
      git config --local core.filemode false
    fi

    echo -e "\e[32mdone.\e[0m"
  fi
done

echo
echo -e "\e[32mWell done.\e[0m"

