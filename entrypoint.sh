#!/bin/sh -l

author=$(cat $GITHUB_EVENT_PATH | jq -r .comment.user.login)
comment=$(cat $GITHUB_EVENT_PATH | jq -r .comment.body)
issue_comments_url=$(cat $GITHUB_EVENT_PATH | jq -r .issue.comments_url)

profanity=$(python3 /check.py "$comment")

if [ "$profanity" = "1" ]; then
    echo "$author said something bad"

    curl --include --verbose --fail \
    -H "Accept: application/json" \
    -H "Content-Type:application/json" \
    -H "Authorization: token ${GITHUB_TOKEN}" \
    --request POST --data '{"body": "@'$author' Please mind your language."}' \
    $issue_comments_url
else
    echo "$author said something good"
fi
