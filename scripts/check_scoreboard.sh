#!/bin/bash
## NOTICE
# Dirty quick script to track the Cybertalent 2021 scoreboard. Buy me a beer :))

## CONSTANTS
SCRIPT_PATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

## GOGO
echo "Starting script..."
cd $SCRIPT_PATH # dirty

python3 "$SCRIPT_PATH/check_scoreboard.py"

if [[ `git status --porcelain` ]]; then
	echo "There are differences, updating"
	git add -A
	git commit -m "[SCOREBOARD] Update"
	git push origin main
  # TODO: python3 "$SCRIPT_PATH/generate_series.py"
else
	echo "No differences"
fi
