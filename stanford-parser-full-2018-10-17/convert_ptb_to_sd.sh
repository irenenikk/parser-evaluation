#!/usr/bin/env bash
#
# Converts PTB trees to Stanford Dependencies

input_file=$1

java -cp stanford-parser.jar edu.stanford.nlp.trees.EnglishGrammaticalStructure -treeFile $input_file -basic