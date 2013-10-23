for I in {1..5}; do
	cat genome"$I" | tr -d "\n" | grep "$1" -Eo | sed "$2" | sort | uniq -c | sort -gr > tmp"$I"
done

paste `for I in {1..5}; do echo tmp"$I"; done`
