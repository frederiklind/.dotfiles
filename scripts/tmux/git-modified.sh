#!/bin/bash

if git rev-parse --isinside-work-tree > /dev/null 2>&1; then
    git fetch > /dev/null 2>&1
    MODIFIED=$(git status --porcelain | grep '^ M' | wc -l)
    if [ $MODIFIED -gt 0 ]; then
        echo "~$MODIFIED"
    else
        echo ""
    fi
else
    echo ""
fi
