#!/bin/sh -l

echo ::set-output name=who::$1
time=$(date)
echo ::set-output name=when::$time
echo ::set-output name=what::$2
