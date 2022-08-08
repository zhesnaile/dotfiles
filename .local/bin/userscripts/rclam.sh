#!/usr/bin/env bash
if echo "$1" "$2" | grep ":" &>/dev/null
then
	rclone copy --update --verbose --transfers 30 --checkers 8 --contimeout 60s --timeout 300s --retries 3 --low-level-retries 10 --stats 1s "$1" "$2"
else
	echo "None of the parameters represent a path in a remote."
fi


