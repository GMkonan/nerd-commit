dates=$1
count=$2

# transform into dates array
IFS=',' read -ra DATES_ARRAY <<< "$dates"

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

echo "${BLUE}[INFO]${NC} Start running dumb thing"

DEFAULT_REPO_PATH="../empty-repo-nerd-commit/"
REPO_PATH="${1:-$DEFAULT_REPO_PATH}"
YEAR="2025"

cd $REPO_PATH

loop_commit() {
	# variable should be a date starting with month and divided by . (e.g. "09.25")
        COMMAND="git commit --allow-empty -m \"This is a NERD COMMIT\" --date=\"\$YEAR.$1 16:20\""
	for i in {1..$count}
	do
	   eval "$COMMAND"
	done
}

for date in "${DATES_ARRAY[@]}"; do
    loop_commit "$date"
done

# Finish it and push
git push origin main

echo "${GREEN}[SUCCESS]${NC} Script finished! Check your github graph :)"