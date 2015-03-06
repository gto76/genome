N=11
rm tmp/*

#run the query over n files
#if combination doesent exist, mark it 0
for ((i=1; i<=$N; i++)); do
	cat genomes/genome"$i" | tr -d "\n" | grep "$1" -Eo | sed "$2" > ./tmp/tmptmp"$i"
done

allCombos=`cat ./tmp/tmptmp* | sort | uniq`

# here 1 should be deduced from every combination
for ((i=1; i<=$N; i++)); do
	echo "$allCombos" | cat ./tmp/tmptmp"$i" - | sort | uniq -c | grep [ACGT]  > ./tmp/tmp"$i"
done

#./trimResults.sh

#print all results side by side
paste `for ((i=1; i<=$N; i++)); do echo ./tmp/tmp"$i"; done`
