# Plots tmp[number] data from tmp folder. Looks for animal names in tmp/names.
#USAGE: ./plotscript.sh "filenames" -> plots tmp1, tmp2 and tmp3

resolution=`xrandr | grep '*' | grep -o '[0-9]*x[0-9]*' | tr x ,`

echo $(
	echo -n "set terminal wxt size $resolution; "
	echo -n "set style data linespoints; "
	echo -n "set xtics rotate by -90; "
	echo -n "set xtics("
	echo -n $(
		i=0
		first=`echo $1 | grep -o "^[^ ]*"` #NEW
		kombinacije=`grep tmp/tmp$first -o -e [ACGT]*`
		for komb in $kombinacije; do
			echo -n "\"$komb\" $i, "
			let 'i = i + 1'
		done
	) | head -c-1
	echo -n "); " 
	echo -n "plot "
	echo -n $(
	for fileName in $1; do
		ime=`cat ./tmp/names | grep "^$fileName" | sed 's/^[^ ]* \(.*\)$/\1/'` #NEW
		echo -n "'tmp/tmp$fileName' title \"$ime\", " #NEW
	done
	) | head -c-1
	echo -n "; "
	echo "replot"
) | gnuplot -p

