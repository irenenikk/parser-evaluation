filename=$1
python ../benepar/parse.py ../inputs/"$filename.txt" > ../berkeley_ptb_trees/"$filename.txt"
./convert_ptb_to_sd.sh ../berkeley_ptb_trees/"$filename.txt" > ../outputs_berkeley/"$filename.txt"
