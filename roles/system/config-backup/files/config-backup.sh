#!/bin/bash

#
# Provided by dmytr's dotfiles
#

cd /etc

git add -A
git commit --allow-empty -m "backup on $1"
