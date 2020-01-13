for file_path in ../gold_standards/*.txt; do
    filename=$(basename $file_path)
    sed -e '/Comments:/,$d' $file_path > "../gold_standards/pure_conlls/$filename"
done