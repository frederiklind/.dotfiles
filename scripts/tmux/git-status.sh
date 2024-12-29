#!/bin/bash

if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    BRANCH=$(git rev-parse --abbrev-ref HEAD)
    echo " ${BRANCH}  "
else
    echo ""
fi
