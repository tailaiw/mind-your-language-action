#!/bin/sh -l

profanity=$(python3 /main.py $1)
echo ::set-output name=profanity::$profanity
