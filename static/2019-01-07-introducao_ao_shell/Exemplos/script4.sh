# Print the first and last data records of each file.
for filename in $@
do
    echo $filename :
    head -n 2 $filename | tail -n 1
    tail -n 1 $filename
done