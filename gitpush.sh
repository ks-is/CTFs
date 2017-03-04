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

BANNER="'##:::'##::'######:::::::'####::'######::\n
 ##::'##::'##... ##::::::. ##::'##... ##:\n
 ##:'##::: ##:::..:::::::: ##:: ##:::..::\n
 #####::::. ######:::::::: ##::. ######::\n
 ##. ##::::..... ##::::::: ##:::..... ##:\n
 ##:. ##::'##::: ##:'###:: ##::'##::: ##:\n
 ##::. ##:. ######:: ###:'####:. ######::\n
.::::..:::......:::...::....:::......:::\n"

HELP="KS.IS CTF Pull-request Github v0.1\n\n
 usage: ./gitpush [Mode] [CTF name]\n
\n
 Mode:\n
  --readme : Updated README.md\n
  --writeup: Updated WriteUp of [CTF name]\n
  --ctf : Updated [CTF name]\n
  --help : Help menu\n
\n
 Report bugs to:\n
   KSIS gmail: ksisgroup@gmail.com"

MODE=$1
CTFNAME=$2


if [[ $MODE == "--readme" ]] 
then
	git add *
	git commit -m ":book: Updated README.md"
	git push
elif [[ $MODE == "--writeup" ]] 
then
	git add *
	git commit -m ":heavy_check_mark: Updated WriteUp of $CTFNAME"
	git push
elif [[ $MODE == "--ctf" ]] 
then
	git add *
	git commit -m ":arrow_up: Updated $CTFNAME"
	git push
else
	echo -e $BANNER
	echo -e $HELP
fi
