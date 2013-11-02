# Outputs all combinations of adjecent characters of length $1
# Reads from standard input
input=`cat`

if [ $1 -gt 0 ]; then
	while [ `echo "$input" | wc -c` -gt "$1"  ]; do
		echo `echo "$input" | head -c$1`
		input=`echo "$input" | sed -e 's/.//'`
	done
fi
