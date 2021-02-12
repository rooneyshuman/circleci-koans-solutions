#!/usr/bin/env bash
set -e
# Deletes branches authored by ox-bot older than 2 weeks
for branch in $(git branch -r | grep -v HEAD | sed /\*/d); do
    # echo $branch
    if [ -z "$(git log -1 -s "${branch}")" ]; then
        branch_data=$(echo -e "$(git show --format="%cr\t%an" "${branch}" | head -n 1)"\\t"$branch")
        echo $branch_data
        author=$(echo "$branch_data"| awk 'BEGIN {FS="\t"}; { print $2 }')
        # if [ "$author" = "ox-bot" ]; then
            # remote_branch="${branch//origin\//}"
            echo "Deleting branch" "$remote_branch" "by" "$author"
            # git push origin --delete "${remote_branch}"
        # fi 
    fi
done