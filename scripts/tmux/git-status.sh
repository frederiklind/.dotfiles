#!/bin/bash

if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    # Get the current branch name
    BRANCH=$(git rev-parse --abbrev-ref HEAD)
    # Output the Git icon and branch name
    echo " ${BRANCH}"
else
    echo ""
fi
