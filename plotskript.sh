echo $(
	echo -n "set style data linespoints; "
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
	echo "plot 'tmp/tmp1' title \"Skorpijon\", 'tmp/tmp2' title \"Kacica\", 'tmp/tmp3' title \"Clovek\", 'tmp/tmp4' title \"Kobilica\", 'tmp/tmp5' title \"Ligenj\", 'tmp/tmp6' title \"Stonoga\", 'tmp/tmp7' title \"Zaba\", 'tmp/tmp9' title \"Riba\", 'tmp/tmp10' title \"Meduza\", 'tmp/tmp11' title \"Morska Zvezda\""
) | gnuplot -p -
