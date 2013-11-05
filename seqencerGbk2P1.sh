# USAGE: ./<script name>.sh "filenames" <no of chars in combinations> <results folder>
# WARNING: Always use double quotes around filenames, so they get
# treated as single argument.
# Only performs first part of operation an saves intermediate results
# in ./comb<number of chars in comb> subfolder.
# Run the query on files, numbered in first argument.
# If combination doesn't exist, mark it 0.

# Create dirs if they don't exist
if [ ! -d "$3" ]; then
	mkdir "$3"
fi
if [ ! -d "$3"/comb"$2"/ ]; then
	mkdir "$3"/comb"$2"/
fi
if [ ! -d "$3"/names/ ]; then
	mkdir "$3"/names/
fi


n=`echo "$1" | wc -w`
i=0
for fName in $1; do
	#remove path from fName
	fNameNoPath=`echo "$fName" | sed 's/^.*\///'` 
	if [ ! -e "$3"/comb"$2"/"$fNameNoPath" ]; then
		genomes=`cat "$fName" | ./getGenFromGbk.sh`
		name=`cat "$fName" | ./getNameFromGbk.sh`
		echo "$genomes" | ./getAllCombos "$2" | sort | uniq -c > "$3"/comb"$2"/"$fNameNoPath"
		echo "$fNameNoPath $name" >> "$3"/names/englishNames
	fi
	#progress bar
	let 'i = i + 1'
	echo -n "$i/$n "
done
echo

# Remove duplicates from names file
cat "$3"/names/englishNames | sort | uniq > "$3"/names/tmp
mv "$3"/names/tmp "$3"/names/englishNames
