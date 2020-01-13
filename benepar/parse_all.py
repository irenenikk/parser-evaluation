import benepar
import nltk
import sys
import time
nltk.download('punkt')
benepar.download('benepar_en2')

input_file = sys.argv[1]
inp = open(input_file, "r").read().splitlines()
start = time.time()
parser = benepar.Parser("benepar_en2")
tree = parser.parse_sents(inp)
end = time.time()
print('Parsing itself took', end - start, 'seconds')
