# Parser evaluation

This project contains everything needed to compare the perforamance between two dependency parsers: Stanford and RASP.

## Running experiments

Use the following command to convert all sentences in the input folder to SD parses in the output folder:

**You must run it in the folder you have installed the Stanford parser**

```
../run_parsers.sh
```

### The stanford parser

Download [here](http://nlp.stanford.edu/software/lex-parser.html#Download).

Run the parser with 

```
./basic_pcfg_parsers.sh ../inputs/xx.txt > ../outputs_stanford_pcfg/xx.txt
```

### The Berkeley parser

First get the parse in a PTB format:

```
python benepar/parse.py inputs/xx.txt > ptb_trees/xx.txt
```

Then change into Stanford Dependency (this should be run in the Stanford directory):

```
./convert_ptb_to_sd.sh ../ptb_trees/xx.txt > ../outputs_berkeley/xx.txt
```
