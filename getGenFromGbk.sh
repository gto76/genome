input=`cat`

echo "$input" | tr "\n" " " | grep -o "ORIGIN.*$" | sed 's/[^acgt]//g' | tr "acgt" "ACGT" 
