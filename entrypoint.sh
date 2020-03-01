#!/bin/sh -l

author=$(cat $GITHUB_EVENT_PATH | jq -r .comment.user.login)
if [ "$GITHUB_EVENT_NAME" = "created" ]; then
    comment=$(cat $GITHUB_EVENT_PATH | jq -r .comment.body)
else
    comment=$(cat $GITHUB_EVENT_PATH | jq -r .changes.body)
fi
echo $comment

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
