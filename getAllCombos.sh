#bin/sh
# Outputs all combinations of adjecent characters of length $1
# Reads from standard input
input=`cat`

if [ $1 -gt 0 ]; then
	len=`echo "$input" | wc -c`
	i=0
	let iEnd=$len-$1
	while [ $i -lt $iEnd ]; do
		echo ${input:$i:$1} 
		let i=$i+1  
	done
fi
