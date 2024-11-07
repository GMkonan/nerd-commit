#!/bin/sh

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

echo "${BLUE}[INFO]${NC} Start running dumb thing"

DEFAULT_REPO_PATH="../empty-repo-nerd-commit/"
REPO_PATH="${1:-$DEFAULT_REPO_PATH}"
YEAR="2024"

cd $REPO_PATH

loop_commit() {
	# variable should be a date starting with month and divided by . (e.g. "09.25")
        COMMAND="git commit --allow-empty -m \"This is a NERD COMMIT\" --date=\"\$YEAR.$1 16:20\""
	# echo "$COMMAND"
	# Loop each commit like 48 times to ensure greeness
	# This number should be dynamic, because it depends on the amount of commits per day of each person
	for i in {1..48}
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

hireme_dates=(
'03.15' '03.14' '03.13' '03.12' '03.11' 
# + 9 days for middle
'03.20' '03.27'
# +7 and -2 and +2
'04.01' '04.02' '04.03' '04.04' '04.05'
#i
'04.19' '04.18' '04.17' '04.16' '04.15'
#r
'05.03' '05.02' '05.01' '04.30' '04.29'

'05.06' '05.13'

'05.21'

'05.08' '05.15'

'05.16'

'05.24'
#e
'06.07' '06.06' '06.05' '06.04' '06.03'

'06.14' '06.21' '06.28'

'06.12' '06.19'

'06.10' '06.17' '06.24'

#m
'07.26' '07.25' '07.24' '07.23' '07.22'

'07.30'

'08.07'

'08.13'

'08.19' '08.20' '08.21' '08.22' '08.23'

'09.02' '09.03' '09.04' '09.05' '09.06'

'09.09' '09.16' '09.23'

'09.11' '09.18'

'09.13' '09.20' '09.27'
)

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

# echo "# empty-repo-nerd-commit" >> README.md

# Finish it and push
git push origin main

echo "${GREEN}[SUCCESS]${NC} Script finished! Check your github graph :)"

