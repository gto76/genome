#make results the same length
maxLines=`wc -l tmp/* | grep -v total | sed 's/^[^0-9]*\([0-9]*\).*/\1/' | sort -n | tail -n1`
for f in tmp/*; do
    tmpLines=`wc -l "$f" | sed 's/^[^0-9]*\([0-9]*\).*/\1/'`
    let "delta = $maxLines - $tmpLines"
    out=""
    for ((i=1; i<=$delta; i++)); do
        out="$out       \t\n"
    done
    echo -e "$out" >> "$f"
done
                                
