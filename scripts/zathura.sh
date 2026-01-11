#!/bin/bash

zathura "$1" > /dev/null 2>&1 & disown
