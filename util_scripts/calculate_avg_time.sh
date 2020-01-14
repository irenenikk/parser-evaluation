command=$1
sum=0
for i in {1..5}
do
    START=$(date +%s)
    eval "$command"
    END=$(date +%s)
    DIFF=$(echo "$END - $START" | bc)
    sum=$((sum+DIFF))
done
echo $((sum/5))