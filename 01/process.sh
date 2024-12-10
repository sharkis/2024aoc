#!/usr/bin/env bash

# squish input spaces
cat input.txt | tr -s ' ' > squish.txt
# combine squish files
paste <( cut -d' ' -f1 squish.txt | sort) <(cut -d' ' -f2 squish.txt| sort) > pasted.txt
# calculate difference between columns (square root of the square for positive result) and add to overall sum
awk -F'\t' '{ sum += sqrt(($1-$2)*($1-$2)) } END { print sum }' pasted.txt
