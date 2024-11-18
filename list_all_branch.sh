#!/bin/bash

ORG="carseven-development"

# リポジトリの一覧を取得
repos=$(gh repo list $ORG --limit 1000 --json name --jq '.[].name')

for repo in $repos; do
  branches=$(gh api repos/$ORG/$repo/branches --jq '.[].name')
  for branch in $branches; do
    # 最新コミットの情報を取得
    commit_info=$(gh api repos/$ORG/$repo/branches/$branch --jq '.commit')
    latest_commit_sha=$(echo $commit_info | jq -r '.sha')
    latest_commit_date=$(gh api repos/$ORG/$repo/commits/$latest_commit_sha --jq '.commit.committer.date')

    formatted_date=$(date -d "$latest_commit_date" +"%Y-%m-%d %H:%M:%S")
    echo -e "$repo\t$branch\t$formatted_date"
  done
done

