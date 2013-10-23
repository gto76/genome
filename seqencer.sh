N=5

rm tmp/*

for ((i=1; i<=$N; i++)); do
	cat genome"$i" | tr -d "\n" | grep "$1" -Eo | sed "$2" | sort | uniq -c | sort -gr > ./tmp/tmp"$i"
done

#make temp files the same length
maxLines=`wc -l tmp/* | grep -v total | sed 's/^[^0-9]*\([0-9]*\).*/\1/' | sort -n | tail -n1`
for f in tmp/*; do
	echo "$f"
	tmpLines=`wc -l "$f" | sed 's/^[^0-9]*\([0-9]*\).*/\1/'`
	#echo "$maxLines -"
	#echo "$tmpLines ="
	let "delta = $maxLines - $tmpLines"
	echo "$delta"
	out=""
	for ((i=1; i<=$delta; i++)); do
		out="$out       \t\n"
	done
	echo "$out"
	echo -e "$out" >> "$f"
done


paste `for ((i=1; i<=$N; i++)); do echo ./tmp/tmp"$i"; done`
