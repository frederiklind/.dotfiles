#!/bin/bash

if git rev-parse --isinside-work-tree > /dev/null 2>&1; then
    git fetch > /dev/null 2>&1
    UNTRACKED=$(git status --porcelain | grep '^??' | wc -l)
    if [ $UNTRACKED -gt 0 ]; then
        echo "+$UNTRACKED"
    else
        echo ""
    fi
else
    echo ""
fi
