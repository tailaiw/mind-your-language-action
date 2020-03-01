#!/bin/sh -l


profanity=$(python3 /check.py $GITHUB_EVENT_PATH)

if [ "$profanity" = "1" ]; then
    echo "someone said something bad"
    reply=$(python3 /react.py $GITHUB_EVENT_PATH)
    echo $reply
else
    echo "someone said something good"
fi
