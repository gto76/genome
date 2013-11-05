# Plots tmp[number] data from tmp folder. Looks for animal names in tmp/names.
#USAGE: ./plotscript.sh "filenames" -> plots tmp1, tmp2 and tmp3
# WARNING: Always use double quotes around filenames, even if you use regex

resolution=`xrandr | grep '*' | grep -o '[0-9]*x[0-9]*' | tr x ,`

echo $(
	echo -n "set key off; " # NEW
	echo -n "set terminal wxt size $resolution; "
	echo -n "set style data linespoints; "
	echo -n "set xtics rotate by -90; "
	echo -n "set xtics("
	echo -n $(
		i=0
		first=`echo $1 | grep -o "^[^ ]*"`
		kombinacije=`grep $first -o -e [ACGT]*`
		for komb in $kombinacije; do
			echo -n "\"$komb\" $i, "
			let 'i = i + 1'
		done
	) | head -c-1
	echo -n "); " 
	echo -n "plot "
	echo -n $(
	for fileName in $1; do
		echo -n "'$fileName', " # NEW
	done
	) | head -c-1
	echo -n "; "
	echo "replot"
) | gnuplot -p

