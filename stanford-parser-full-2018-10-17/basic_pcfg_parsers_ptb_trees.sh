#!/usr/bin/env bash
#
# Runs the English PCFG parser on one or more files, printing basic stanford dependencies

if [ ! $# -ge 1 ]; then
  echo Usage: `basename $0` 'file(s)'
  echo
  exit
fi

scriptdir=`dirname $0`

java -Xmx2048m -cp "$scriptdir/*:" edu.stanford.nlp.parser.lexparser.LexicalizedParser \
 -outputFormat "penn"  -printPCFGkBest 5 -outputFormatOptions "basicDependencies" \
  -originalDependencies edu/stanford/nlp/models/lexparser/englishPCFG.ser.gz $* 
