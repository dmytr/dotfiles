#!/bin/bash

BASE="$(dirname $0)"
cd $BASE/..

git submodule foreach git pull
