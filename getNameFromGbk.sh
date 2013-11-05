input=`cat`

name=`echo "$input" | grep SOURCE -A1 | tr "\n" "  " | sed 's/.*(\(.*\)).*/\1\n/' | sed 's/\( \)\1*/\1/g'`

containsSource=`echo "$name" | grep SOURCE -o`
if [[ "$containsSource" != "" ]]; then
	lastLatin=`echo "$name" | sed 's/^.* \([a-z]*\) ORGANISM.*$/\1/'`
	name2=`echo "$name" | sed 's/^.*ORGANISM.*'$lastLatin' \(.*\)$/\1/'`
	if [[ "$name2" == "" ]]; then
		name2=`echo "$name" | sed 's/^.*ORGANISM \(.*\)$/\1/'`
	fi
	name="$name2"
fi

echo "$name"
