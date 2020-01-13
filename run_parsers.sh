#!/bin/bash
# !!!!!!!!!!! run me in the Stanford parser folder !!!!!!!!!!!
for file_path in ../inputs/*.txt; do
    filename=$(basename $file_path)
    # the stanford parser
    #./basic_pcfg_parsers.sh "$file_path" > ../outputs_stanford_pcfg/"$filename"
    ./basic_pcfg_parsers_ptb_trees.sh "$file_path" > ../stanford_ptb_trees/"$filename"
    python ../benepar/parse.py "$file_path" > ../berkeley_ptb_trees/"$filename"
    ./convert_ptb_to_sd.sh ../berkeley_ptb_trees/"$filename" > ../outputs_berkeley/"$filename"
done
