# Prints only the gene sequence from the gbk file. File needs to be piped in.

input=`cat`

echo "$input" | tr "\n" " " | grep -o "ORIGIN.*$" | sed 's/[^acgt]//g' | tr "acgt" "ACGT" 
