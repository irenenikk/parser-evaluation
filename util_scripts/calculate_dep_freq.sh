#!/bin/bash
# files should be a regex matching the desired output files
filepaths=$1
dep=$2
count=0
for f in $filepaths; do
    amount=$(grep "$dep" $f | wc -l)
    count=$((count+amount))
done
echo $count