N=11
rm tmp/*

#run the query over n files
#if combination doesent exist, mark it 0
#order by global frequency of combination
for ((i=1; i<=$N; i++)); do
	cat genome"$i" | tr -d "\n" | grep "$1" -Eo | sed "$2" > ./tmp/tmptmp"$i"
done

allCombos=`cat ./tmp/tmptmp* | sort | uniq`
allCombosOrder=`cat ./tmp/tmptmp* | sort | uniq -c | sort -n | grep -o [ACGT]* | tr '\n' ' '`

#tle bi blo treba vsaki kombinaciji še odštet 1
for ((i=1; i<=$N; i++)); do
	tmptmp=`echo "$allCombos" | cat ./tmp/tmptmp"$i" - | sort | uniq -c | grep [ACGT]`
	for comb in $allCombosOrder; do
		echo "$tmptmp" | grep "$comb" >> ./tmp/tmp"$i"
	done
done

#print all results side by side
paste `for ((i=1; i<=$N; i++)); do echo ./tmp/tmp"$i"; done`
