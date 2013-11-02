rm tmp/*

#USAGE: ./sequencer5.sh "1 2 3"
#run the query on files, numbered in first argument
#if combination doesn't exist, mark it 0
#order by global frequency of combination
for i in $1; do
	cat genomes/genome"$i" | tr -d "\n" | grep "$2" -Eo | sed "$3" > ./tmp/tmptmp"$i"
done

allCombos=`cat ./tmp/tmptmp* | sort | uniq`
allCombosOrder=`cat ./tmp/tmptmp* | sort | uniq -c | sort -n | grep -o [ACGT]* | tr '\n' ' '`

#tle bi blo treba vsaki kombinaciji še odštet 1
for i in $1; do
	tmptmp=`echo "$allCombos" | cat ./tmp/tmptmp"$i" - | sort | uniq -c | grep [ACGT]`
	for comb in $allCombosOrder; do
		echo "$tmptmp" | grep "$comb" >> ./tmp/tmp"$i"
	done
done

#print all results side by side
paste `for i in $1; do echo ./tmp/tmp"$i"; done`
