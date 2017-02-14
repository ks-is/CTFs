#!/bin/bash - 
#===============================================================================
#
#          FILE: gitpush.sh
# 
#         USAGE: ./gitpush.sh 
# 
#   DESCRIPTION: Commit and push to github
# 
#        AUTHOR: TraiOi, 
#  ORGANIZATION: KSIS
#       CREATED: 11/06/2016 16:45
#===============================================================================

set -o nounset                              # Treat unset variables as an error

git add *
git commit -m "Updated $1"
git push
