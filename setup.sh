#!/bin/sh

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

echo "${BLUE}[INFO]${NC} Start running dumb thing"

DEFAULT_REPO_PATH="$HOME/code/projects/test-cm-empty/"
REPO_PATH="${1:-$DEFAULT_REPO_PATH}"
YEAR="2024"

cd $REPO_PATH

loop_commit() {
	# variable should be a date starting with month and divided by . (e.g. "09.25")
        COMMAND="git commit --allow-empty -m \"This is a NERD COMMIT\" --date=\"\$YEAR.$1 16:20\""
	# echo "$COMMAND"
	# Loop each commit like 20 times to ensure greeness
	for i in {1..20}
	do
	   eval "$COMMAND"
	done
}

# commit dates (doing by year so, 2024)
# N => April 8,9,10,11,12 | april 16 | april 24 | april 29, 30 may 1,2,3
# E => May 20, 21, 22, 23 ,24 | may 31, june 7, june 14 | may 29, june 5 | may 27, june 3, june 10
# R => July 1, 2, 3, 4, 5 | July 8, 15 | July 23 | July 10, 17 | July 18 | July 26
# D => August 12,13,14,15,16 | August 19, 26 | September 3, 4, 5 | August 23, 30

# Commit/Draw for each day you want 

dates=(
    ############ N ############
    '04.08' '04.09' '04.10' '04.11' '04.12' '04.16' '04.24' '04.29' '04.30'
    '05.01' '05.02' '05.03'
    
    ############ E ############
    '05.20' '05.21' '05.22' '05.23' '05.24' '05.31' '06.07' '06.14' '05.29'
    '06.05' '05.27' '06.03' '06.10'
    
    ############ R ############
    '07.01' '07.02' '07.03' '07.04' '07.05' '07.08' '07.15' '07.23' '07.10'
    '07.17' '07.18' '07.26'
    
    ############ D ############
    '08.12' '08.13' '08.14' '08.15' '08.16' '08.19' '08.26' '09.03' '09.04'
    '09.05' '08.23' '08.30'
)

for date in "${dates[@]}"; do
    loop_commit "$date"
done


############ N ############
# loop_commit '04.08'
# loop_commit '04.09'
# loop_commit '04.10'
# loop_commit '04.11'
# loop_commit '04.12'
#
# loop_commit '04.16'
#
# loop_commit '04.24'
#
# loop_commit '04.29'
# loop_commit '04.30'
# loop_commit '05.01'
# loop_commit '05.02'
# loop_commit '05.03'
#
# ############ E ############
# loop_commit '05.20'
# loop_commit '05.21'
# loop_commit '05.22'
# loop_commit '05.23'
# loop_commit '05.24'
#
# loop_commit '05.31'
# loop_commit '06.07'
# loop_commit '06.14'
#
# loop_commit '05.29'
# loop_commit '06.05'
#
# loop_commit '05.27'
# loop_commit '06.03'
# loop_commit '06.10'
#
# ############ R ############
# loop_commit '07.01'
# loop_commit '07.02'
# loop_commit '07.03'
# loop_commit '07.04'
# loop_commit '07.05'
#
# loop_commit '07.08'
# loop_commit '07.15'
#
# loop_commit '07.23'
#
# loop_commit '07.10'
# loop_commit '07.17'
#
# loop_commit '07.18'
#
# loop_commit '07.26'
#
# ############ D ############
# loop_commit '08.12'
# loop_commit '08.13'
# loop_commit '08.14'
# loop_commit '08.15'
# loop_commit '08.16'
#
# loop_commit '08.19'
# loop_commit '08.26'
#
# loop_commit '09.03'
# loop_commit '09.04'
# loop_commit '09.05'
#
# loop_commit '08.23'
# loop_commit '08.30'


# Finish it and push
git push origin main

echo "${GREEN}Script finished! Check your github graph :)"

