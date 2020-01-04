# Parser evaluation

This project scripts used to compare the perforamance between two dependency parsers: Stanford and RASP.

## Folder structure

The `inputs` folder should contain the input phrases, each in their own txt file with their unique id. These will be parsed into the `outputs` folder.

## Running experiments

You need to instll the Stanford parser separately in order to run the experiments. You can do so from [here](http://nlp.stanford.edu/software/lex-parser.html#Download). The Berkeley parser is used as a Python package, and will be installed automatically when you run the script. 

After having installed the Stanford parser, use the following command to convert all sentences in the input folder to SD parses in the output folder:

**You must run it in the folder you have installed the Stanford parser**

```
../run_parsers.sh
```

### The stanford parser


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
