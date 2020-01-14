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

# deprel
java -jar maltEval/lib/MaltEval.jar -s "outputs_stanford_pcfg_best/conll_files/" -g "gold_standards/pure_conlls/" --GroupBy Deprel --Metric self > "evaluation_results/deprel/stanford_summary"
java -jar maltEval/lib/MaltEval.jar -s "outputs_berkeley/conll_files/" -g "gold_standards/pure_conlls/" --GroupBy Deprel --Metric self > "evaluation_results/deprel/berkeley_summary"
# las
java -jar maltEval/lib/MaltEval.jar -s "outputs_stanford_pcfg_best/conll_files/" -g "gold_standards/pure_conlls/" --Metric LAS > "evaluation_results/las/stanford_summary"
java -jar maltEval/lib/MaltEval.jar -s "outputs_berkeley/conll_files/" -g "gold_standards/pure_conlls/" --Metric LAS > "evaluation_results/las/berkeley_summary"
# uas
java -jar maltEval/lib/MaltEval.jar -s "outputs_stanford_pcfg_best/conll_files/" -g "gold_standards/pure_conlls/" --Metric UAS > "evaluation_results/uas/stanford_summary"
java -jar maltEval/lib/MaltEval.jar -s "outputs_berkeley/conll_files/" -g "gold_standards/pure_conlls/" --Metric UAS > "evaluation_results/uas/berkeley_summary"
