#! /usr/bin/env bash 

datasets="$HOME/data-sets"
# Which state in states.tab.gz has the lowest murder rate?



states="$datasets/misc/states.tab.gz"

answer_1=$(gzcat $states \
    | grep -v '^#' \
    | cut -f1,6 \
    | sort -k2g \
    | head -n1 \
    | cut -f1 \
    | sed 's/"//g') 

echo "answer-1: $answer_1"
#Which state in states.tab.gz has the lowest murder rate?

#Which state in states.tab.gz has the lowest murder rate?


