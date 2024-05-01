#!/bin/bash

if [[ $# -eq 0 || "$1" != "-m" ]]; then
    echo "Usage: $0 -m \"commit message\""
    exit 1
fi

commit_message="$2"

git add -A && git commit -m "$commit_message" && git push
