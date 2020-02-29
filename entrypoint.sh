#!/bin/sh -l

sentiment=$(python3 /sentiment.py $1 $2)
echo ::set-output name=sentiment::$sentiment
