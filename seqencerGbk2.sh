#USAGE: ./sequencerGbk.sh "filenames" <no of chars in combinations> <optional sed query>
#run the query on files, numbered in first argument
#if combination doesn't exist, mark it 0
#order by global frequency of combination

if [ ! -d ./tmp"$2"/ ]; then
	mkdir ./tmp"$2"/
fi

n=`echo $1 | wc -w`
i=0

for i in $1; do
	if [ ! -e ./tmp"$2"/"$i" ]; then
		genomes=`cat ./test/"$i" | ./getGenFromGbk.sh`
		name=`cat ./test/"$i" | ./getNameFromGbk.sh`
		echo "$genomes" | ./getAllCombos "$2" | sort | uniq -c > ./tmp"$2"/"$i"
		echo "$i $name" >> ./names/englishNames
	fi
	#progress bar
	let i = i + 1
	echo -n "$i/$n "
done

########
#TODO


rm tmp/*

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
