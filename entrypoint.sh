#!/bin/sh -l

author=$1
comment=$2

profanity=$(python3 /main.py $2)

if [ "$profanity" = "1" ]; then
    echo "@$author said something bad"
else
    echo "@$author said something good"
fi
