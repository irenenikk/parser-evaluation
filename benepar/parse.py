import benepar
import nltk
import sys
nltk.download('punkt')
benepar.download('benepar_en2')

input_file = sys.argv[1]
inp = open(input_file, "r").read()
parser = benepar.Parser("benepar_en2")
tree = parser.parse(inp)
print(tree)
