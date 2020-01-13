#!/bin/bash
target="inputs/all.txt"
for file_path in ../inputs/*.txt; do
    cat "$file_path" >> $target
    echo '' >> $target
done
