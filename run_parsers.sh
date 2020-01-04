#!/bin/bash
# !!!!!!!!!!! run me in the Stanford parser folder !!!!!!!!!!!
for file_path in ../inputs/*.txt; do
    filename=$(basename $file_path)
    # the stanford parser
    ./basic_pcfg_parsers.sh "$file_path" > ../outputs_stanford_pcfg/"$filename"
    python ../benepar/parse.py "$file_path" > ../ptb_trees/"$filename"
    ./convert_ptb_to_sd.sh ../ptb_trees/"$filename" > ../outputs_berkeley/"$filename"
done
