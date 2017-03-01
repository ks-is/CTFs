#!/bin/bash
# Script to contribute repository https://github.com/ks-is/CTFs/
# Usage: ./contribute.sh "comment" branch
# Example: ./contribute.sh "Add write-up neverlan-ctf-2017/web" h4rdw0rk-28022107

# Return previous branch if checkout fail
#git checkout - 

# Delete a branch
#git branch -D the_local_branch
#git push origin :the_remote_branch

# If error happen when delete branch
#git fetch --prune

COMMENT=$1
BRANCH=$2

test ! $# -eq 2 && { echo "Usage: $0 \"comment\" branch"; echo ; exit 1; }

# Lay du lieu tu repository xuong local
#git clone git@github.com:h4rdw0rk/CTFs.git
#cd CTFs/
#git remote add upstream git@github.com:ks-is/CTFs.git

# Lay xuong local cac thay doi tren remote va gop vao chung
git fetch upstream
git merge upstream/master

# Tao topic branch moi
git checkout -b $BRANCH

# Day cac thay doi tu local len remote
git add -A
git commit -am "$COMMENT"
git push origin $BRANCH
