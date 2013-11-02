# Plots tmp[number] data from tmp folder. Looks for animal names in tmp/names.
#USAGE: ./plotscript.sh "1 2 3" -> plots tmp1, tmp2 and tmp3

resolution=`xrandr | grep '*' | grep -o '[0-9]*x[0-9]*' | tr x ,`

echo $(
	echo -n "set terminal wxt size $resolution; "
	echo -n "set style data linespoints; "
	echo -n "set xtics rotate by -90; "
	echo -n "set xtics("
	echo -n $(
		i=0
		first=`echo $1 | grep -o ^[0-9]*`
		kombinacije=`grep tmp/tmp$first -o -e [ACGT]*`
		for komb in $kombinacije; do
			echo -n "\"$komb\" $i, "
			let 'i = i + 1'
		done
	) | head -c-1
	echo -n "); " 
	echo -n "plot "
	echo -n $(
	for num in $1; do
		ime=`cat genomes/names | grep "^$num " | sed 's/.*\"\(.*\)\".*/\1/'`
		echo -n "'tmp/tmp$num' title \"$ime\", "
	done
	) | head -c-1
	echo -n "; "
	echo "replot"
) | gnuplot -p

