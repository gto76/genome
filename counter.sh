#	Način da prideš do pipe in
#   input=`cat`
#	echo "$input" | less
                                                                
# Koliko ponovitev enakih bitov imamo
cat "$1" | grep A* -o | sort | uniq -c
cat "$1" | grep C* -o | sort | uniq -c
cat "$1" | grep G* -o | sort | uniq -c
cat "$1" | grep T* -o | sort | uniq -c

# Število bitov
#sum=$(cat "$1" | grep [^TG][^TG][^TG] -Eo | sort | uniq -c | tr -d "A-Z " | awk '{ sum += $1 } END { print sum }')
#echo "$sum"


