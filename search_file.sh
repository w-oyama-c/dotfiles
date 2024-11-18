#!/bin/bash

### functions ######################################################################################

### main scripts ###################################################################################

if [ $# -ne 1 ]; then exit -1; fi

org="carseven-development"
echo

gh repo list carseven-development --json name | jq -r '.[] | [.name] | @tsv' | {
  while IFS=$(printf '\t') read -r name; do
    gh api -X GET "repos/$org/$name/contents" | \
    if [ $(grep -c $1) -gt 0 ]; then
      echo "Found in $name";
    fi
  done
}

echo
echo -e "\e[32mWell done!\e[0m"

