N=11
rm tmp/*

#run the query over n files
for ((i=1; i<=$N; i++)); do
	cat genome"$i" | tr -d "\n" | grep "$1" -Eo | sed "$2" | sort | uniq -c | sort -gr | grep [ACGT] > ./tmp/tmp"$i"
done

./trimResults.sh

#print all results side by side
paste `for ((i=1; i<=$N; i++)); do echo ./tmp/tmp"$i"; done`
