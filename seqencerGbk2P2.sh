# USAGE: ./<scriptname>.sh "filenames" <>
# ./sequencerGbk.sh "filenames" <no of chars in combinations> <optional sed query>
# run the query on files, numbered in first argument
# if combination doesn't exist, mark it 0
# order by global frequency of combination

rm ./tmp/* 

allCombos=`cat $1 | sed 's/^ *[0-9]\+ //' | sort -u`
combosPerGenom=`cat $1 | sort -k2`
for combo in "$allCombos"; do
	sum=`echo "$combosPerGenom" | grep "$combo" | grep [0-9]* -o | paste -sd+ | bc`
	echo "$sum $combo" >> ./tmp/allCombos
done
allCombosOrder=`cat ./tmp/allCombos | sort -n | grep -o [ACGT]* | tr '\n' ' '`

#grepamo fajl z vsemi kombinacijami	po vrsti
#če slučajno ne obstaja damo v fajl: 0 <kombinacija>
n=`ls -l $1 | wc -l`
i=0
for fName in $1; do
	fNameNoPath=`echo "$fName" | sed 's/^.*\///'`
	for comb in $allCombosOrder; do
		comb2=`cat "$fName" | grep "$comb"`
		if [ "$comb2" == "" ]; then
			echo "0 $comb" >> ./tmp/tmp"$fNameNoPath"		
		else
			echo "$comb2" >> ./tmp/tmp"$fNameNoPath"
		fi
	done
	#progress bar
	let 'i = i + 1'
	echo -n "$i/$n "
done
echo

rm ./tmp/allCombos

#print all results side by side
paste $(for i in $1; do fNameNoPath=$(echo "$fName" | sed 's/^.*\///'); echo ./tmp/tmp"$fNameNoPath"; done)
