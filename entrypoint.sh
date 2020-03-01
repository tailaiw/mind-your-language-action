#!/bin/sh -l


profanity=$(python3 /main.py $GITHUB_EVENT_PATH)

if [ "$profanity" = "1" ]; then
    echo "@$author said something bad"
else
    echo "@$author said something good"
fi
