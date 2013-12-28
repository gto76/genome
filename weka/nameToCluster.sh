cat | grep "^[0-9]" | cut -d ',' -f 2,19 | while read line
do
	name=$(grep names/englishNames -e $(echo "$line" | sed 's/,.*//') | sed 's/^[^ ]*//')
	cluster=`echo "$line" | sed 's/.*,cluster//'`
	echo "$cluster > $name"
done

