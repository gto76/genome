# Prints all the species names from the gbk files in passed directory.

for file in "$1"*; do
	cat "$file" | ./getNameFromGbk.sh
done

