for file_path in ../stanford_ptb_trees/*.txt; do
    filename=$(basename $file_path)
    # the stanford parser
    ./convert_sd_to_conll.sh "$file_path" > ../outputs_stanford_pcfg_best/conll_files/"$filename"
done

for file_path in ../berkeley_ptb_trees/*.txt; do
    filename=$(basename $file_path)
    # the stanford parser
    ./convert_sd_to_conll.sh "$file_path" > ../outputs_berkeley/conll_files/"$filename"
done
