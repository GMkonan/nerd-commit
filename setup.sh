#!/bin/sh

echo "Start running dumb thing"

REPO_PATH="$HOME/code/projects/test-cm-empty/"
cd $REPO_PATH

loop_commit() {
	# Loop each commit like 15 times to ensure greeness
	for i in {1..15}
	do
	   eval "$1"
	done
}

# commit dates (doing by year so, 2024)
# N => April 8,9,10,11,12 | april 16 | april 24 | april 29, 30 may 1,2,3
# E => May 20, 21, 22, 23 ,24 | may 31, june 7, june 14 | may 29, june 5 | may 27, june 3, june 10
# R => July 1, 2, 3, 4, 5 | July 8, 15 | July 23 | July 10, 17 | July 18 | July 26
# D => August 12,13,14,15,16 | August 19, 26 | September 3, 4, 5 | August 23, 30



# Commit/Draw for each day you want 

############ N ############
loop_commit 'git commit --allow-empty -m "this is a nerd commit" --date="2024.04.08 16:20"'
loop_commit 'git commit --allow-empty -m "This is a NERD COMMIT" --date="2024.04.09 16:20"'
loop_commit 'git commit --allow-empty -m "This is a NERD COMMIT" --date="2024.04.10 16:20"'
loop_commit 'git commit --allow-empty -m "This is a NERD COMMIT" --date="2024.04.11 16:20"'
loop_commit 'git commit --allow-empty -m "This is a NERD COMMIT" --date="2024.04.12 16:20"'

loop_commit 'git commit --allow-empty -m "This is a NERD COMMIT" --date="2024.04.16 16:20"'

loop_commit 'git commit --allow-empty -m "This is a NERD COMMIT" --date="2024.04.24 16:20"'

loop_commit 'git commit --allow-empty -m "This is a NERD COMMIT" --date="2024.04.29 16:20"'
loop_commit 'git commit --allow-empty -m "This is a NERD COMMIT" --date="2024.04.30 16:20"'
loop_commit 'git commit --allow-empty -m "This is a NERD COMMIT" --date="2024.05.01 16:20"'
loop_commit 'git commit --allow-empty -m "This is a NERD COMMIT" --date="2024.05.03 16:20"'

############ E ############
loop_commit 'git commit --allow-empty -m "This is a NERD COMMIT" --date="2024.05.20 16:20"'
loop_commit 'git commit --allow-empty -m "This is a NERD COMMIT" --date="2024.05.21 16:20"'
loop_commit 'git commit --allow-empty -m "This is a NERD COMMIT" --date="2024.05.22 16:20"'
loop_commit 'git commit --allow-empty -m "This is a NERD COMMIT" --date="2024.05.23 16:20"'
loop_commit 'git commit --allow-empty -m "This is a NERD COMMIT" --date="2024.05.24 16:20"'

loop_commit 'git commit --allow-empty -m "This is a NERD COMMIT" --date="2024.05.31 16:20"'
loop_commit 'git commit --allow-empty -m "This is a NERD COMMIT" --date="2024.06.07 16:20"'
loop_commit 'git commit --allow-empty -m "This is a NERD COMMIT" --date="2024.06.14 16:20"'

loop_commit 'git commit --allow-empty -m "This is a NERD COMMIT" --date="2024.05.29 16:20"'
loop_commit 'git commit --allow-empty -m "This is a NERD COMMIT" --date="2024.06.05 16:20"'

loop_commit 'git commit --allow-empty -m "This is a NERD COMMIT" --date="2024.05.27 16:20"'
loop_commit 'git commit --allow-empty -m "This is a NERD COMMIT" --date="2024.06.03 16:20"'
loop_commit 'git commit --allow-empty -m "This is a NERD COMMIT" --date="2024.06.10 16:20"'

############ R ############
loop_commit 'git commit --allow-empty -m "This is a NERD COMMIT" --date="2024.07.01 16:20"'
loop_commit 'git commit --allow-empty -m "This is a NERD COMMIT" --date="2024.07.02 16:20"'
loop_commit 'git commit --allow-empty -m "This is a NERD COMMIT" --date="2024.07.03 16:20"'
loop_commit 'git commit --allow-empty -m "This is a NERD COMMIT" --date="2024.07.04 16:20"'
loop_commit 'git commit --allow-empty -m "This is a NERD COMMIT" --date="2024.07.05 16:20"'

loop_commit 'git commit --allow-empty -m "This is a NERD COMMIT" --date="2024.07.08 16:20"'
loop_commit 'git commit --allow-empty -m "This is a NERD COMMIT" --date="2024.07.15 16:20"'

loop_commit 'git commit --allow-empty -m "This is a NERD COMMIT" --date="2024.07.23 16:20"'

loop_commit 'git commit --allow-empty -m "This is a NERD COMMIT" --date="2024.07.10 16:20"'
loop_commit 'git commit --allow-empty -m "This is a NERD COMMIT" --date="2024.07.17 16:20"'

loop_commit 'git commit --allow-empty -m "This is a NERD COMMIT" --date="2024.07.18 16:20"'

loop_commit 'git commit --allow-empty -m "This is a NERD COMMIT" --date="2024.07.26 16:20"'

############ D ############
loop_commit 'git commit --allow-empty -m "This is a NERD COMMIT" --date="2024.08.12 16:20"'
loop_commit 'git commit --allow-empty -m "This is a NERD COMMIT" --date="2024.08.13 16:20"'
loop_commit 'git commit --allow-empty -m "This is a NERD COMMIT" --date="2024.08.14 16:20"'
loop_commit 'git commit --allow-empty -m "This is a NERD COMMIT" --date="2024.08.15 16:20"'
loop_commit 'git commit --allow-empty -m "This is a NERD COMMIT" --date="2024.08.16 16:20"'

loop_commit 'git commit --allow-empty -m "This is a NERD COMMIT" --date="2024.08.19 16:20"'
loop_commit 'git commit --allow-empty -m "This is a NERD COMMIT" --date="2024.08.26 16:20"'

loop_commit 'git commit --allow-empty -m "This is a NERD COMMIT" --date="2024.09.03 16:20"'
loop_commit 'git commit --allow-empty -m "This is a NERD COMMIT" --date="2024.09.04 16:20"'
loop_commit 'git commit --allow-empty -m "This is a NERD COMMIT" --date="2024.09.05 16:20"'

loop_commit 'git commit --allow-empty -m "This is a NERD COMMIT" --date="2024.08.23 16:20"'
loop_commit 'git commit --allow-empty -m "This is a NERD COMMIT" --date="2024.08.30 16:20"'


# Finish it and push
#git push origin main

echo "Script finished! Check your github graph :)"

