#!/bin/sh -l

author=$(cat $GITHUB_EVENT_PATH | jq -r .comment.user.login)
comment=$(cat $GITHUB_EVENT_PATH | jq -r .comment.body)

profanity=$(python3 /check.py $comment)

if [ "$profanity" = "1" ]; then
    echo "$author said something bad"
    reply=$(python3 /react.py $author)
    echo $reply
else
    echo "$author said something good"
fi
