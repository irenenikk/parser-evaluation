# Evaluating the Stanford PCFG parser against the Berkeley neural parser

This project contains the scripts used to compare the perforamance between two dependency parsers: The Stanford PCFG parser, and the Berkeley neural parser. The repository does not contain the parsers themselves.

## Folder structure

The `inputs` folder contains the input phrases, each in their own txt file with their unique id. These will be parsed into the `outputs` folders. The `outputs` folders contain the Penn Treebank trees and the final Stanford Dependencies for each sentence. The folder `outputs_stanford_pcfg_best` only contains the best parse instead of top 5 parses. The folder `gold_standards` contains the crowdsourced gold standards used in the analysis, as well as comments about the mistakes made by each parser.

The folder `stanford-parser-full-2018-10-17` does not contain the Stanford parser itself, but scirpts which have been modified from Stanford parser's examples. Other scripts are found in the `util_scripts` folder

## Running experiments

You need to install the Stanford parser separately in order to run the experiments. You can do so from [here](http://nlp.stanford.edu/software/lex-parser.htm). The Berkeley parser is used as a Python package, and installation instructions are found [here](https://github.com/nikitakit/self-attentive-parser#installation). This project uses the NLTK integration, so make sure to install the additional stuff. 

After having installed both parsers, use the following command to convert all sentences in the input folder to SD parses in the output folder:

**You must run it in the folder you have installed the Stanford parser, e.g. stanford-parser-full-2018-10-17**

```
../run_parsers.sh
```

### The stanford parser


Run the parser for a single sentence with

```
./basic_pcfg_parsers.sh ../inputs/xx.txt > ../outputs_stanford_pcfg/xx.txt
```

found inside the folder `stanford-parser-full-2018-10-17`.

### The Berkeley parser

First get the parse in a PTB format:

```
python benepar/parse.py inputs/xx.txt > berkeley_ptb_trees/xx.txt
```

Then change into Stanford Dependency (this should be run in the Stanford directory):

```
./convert_ptb_to_sd.sh ../berkeley_ptb_trees/xx.txt > ../outputs_berkeley/xx.txt
```

### Conversion scripts

Conversion scripts from PTB to CONLL are in the `util_scripts` folder. Use `stanford-parser-full-2018-10-17/convert_ptb_to_sd.sh` to convert PTB trees to SDs.

### Quantitative evaluation

This project uses MaltEval for quantitative analysis, but does not contain the jar for it. You can run the quantiative analysis with the script `utils_scripts/evaluate_sentences.sh`. The results will be stored in the folder `evaluation_results`.
