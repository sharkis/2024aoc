#!/usr/bin/env bash

# step one
: <<END_STEPONE
# squish input spaces
cat input.txt | tr -s ' ' > squish.txt
# combine squish files
paste <( cut -d' ' -f1 squish.txt | sort) <(cut -d' ' -f2 squish.txt| sort) > pasted.txt
# calculate difference between columns (square root of the square for positive result) and add to overall sum
 awk -F'\t' '{ sum += sqrt(($1-$2)*($1-$2)) } END { print sum }' pasted.txt
# count instances of left column in right column, multiply, add to new overall sum
END_STEPONE

# step two
# squish input spaces
cat input.txt | tr -s ' ' > squish.txt
cut -d' ' -f1 squish.txt > col1.txt
cut -d' ' -f2 squish.txt > col2.txt
sum=0
while read searchline; do
((sum+=$(( $searchline * $(grep -o $searchline col2.txt | wc -l)))))
done < col1.txt
echo $sum
