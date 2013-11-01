#USAGE: ./plotscript.sh "1 2 3"

resolution=`xrandr | grep '*' | grep -o '[0-9]*x[0-9]*' | tr x ,`

echo $(
	echo -n "set terminal wxt size $resolution; "
	echo -n "set style data linespoints; "
	echo -n "set xtics rotate by -90; "
	echo -n "set xtics("
	echo -n $(
		i=0
		kombinacije=`grep tmp/tmp1 -o -e [ACGT]*`
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
	#echo -n "plot 'tmp/tmp1' title \"Skorpijon\", 'tmp/tmp2' title \"Kacica\", 'tmp/tmp3' title \"Clovek\", 'tmp/tmp4' title \"Kobilica\", 'tmp/tmp5' title \"Ligenj\", 'tmp/tmp6' title \"Stonoga\", 'tmp/tmp7' title \"Zaba\", 'tmp/tmp9' title \"Riba\", 'tmp/tmp10' title \"Meduza\", 'tmp/tmp11' title \"Morska Zvezda\"; "
	echo "replot"
)  | gnuplot -p

