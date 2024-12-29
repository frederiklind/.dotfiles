#!/bin/bash

if git rev-parse --isinside-work-tree > /dev/null 2>&1; then
    git fetch > /dev/null 2>&1
    DELETED=$(git status --porcelain | grep '^ D' | wc -l)
    if [ $DELETED -gt 0 ]; then
        echo "-$DELETED"
    else
        echo ""
    fi
else
    echo ""
fi
