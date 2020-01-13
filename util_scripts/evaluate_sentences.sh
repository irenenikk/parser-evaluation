#!/bin/bash
for file_path in inputs/*.txt;
do
    filename=$(basename $file_path)
    sent_num=${filename%.*}
    if ! [[ "$sent_num" =~ ^[0-9]+$ ]]
    then
        echo "Not a number, skipping"
        continue
    fi
    ./util_scripts/evaluate_sentence.sh  "$sent_num"
done
