#!/usr/bin/env bash
#
# Runs the English PCFG parser on one or more files, printing basic stanford dependencies

if [ ! $# -ge 1 ]; then
  echo Usage: `basename $0` 'file(s)'
  echo
  exit
fi

sent_num=$1

java -jar maltEval/lib/MaltEval.jar -s "outputs_berkeley/conll_files/$sent_num.txt" "outputs_stanford_pcfg_best/conll_files/$sent_num.txt" -g "gold_standard_fixed/sentence_$sent_num.txt" --GroupBy Deprel --Metric self > "evaluation_results/deprel/${sent_num}.txt"
java -jar maltEval/lib/MaltEval.jar -s "outputs_berkeley/conll_files/$sent_num.txt" "outputs_stanford_pcfg_best/conll_files/$sent_num.txt" -g "gold_standard_fixed/sentence_$sent_num.txt" --Metric LAS > "evaluation_results/las/${sent_num}.txt"
java -jar maltEval/lib/MaltEval.jar -s "outputs_berkeley/conll_files/$sent_num.txt" "outputs_stanford_pcfg_best/conll_files/$sent_num.txt" -g "gold_standard_fixed/sentence_$sent_num.txt" --Metric UAS > "evaluation_results/uas/${sent_num}.txt"
