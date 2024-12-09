#!/usr/bin/env bash

# squish input spaces
cat input.txt | tr -s ' ' > squish.txt
paste <( cut -d' ' -f1 squish.txt | sort) <(cut -d' ' -f2 squish.txt| sort)

