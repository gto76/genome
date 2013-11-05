
for file in "$1"*; do
	cat "$file" | ./getNameFromGbk.sh
done

