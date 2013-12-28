for file in *; do
	id=`echo "$file" | sed 's/[^0-9]//g'`
	data=`cat "$file" |sed ':a;N;$!ba;s/\n/ /g' | sed 's/ //g' | 
	sed -r 's/[ACGT]+/,/g' | sed 's/,$//'`
	echo "$id,$data"
done