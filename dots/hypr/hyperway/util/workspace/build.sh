#!/bin/bash

SCRIPT_DIR=$(dirname ${BASH_SOURCE[0]})

cd $SCRIPT_DIR

gcc -O2 -s -o waybar_output waybar_output.c
