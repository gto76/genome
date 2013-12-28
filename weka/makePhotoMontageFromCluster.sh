cat comb2ResultsWithNames | 
grep ^0 | 
sed 's/^[0-9]* >  /\"images\//' | 
sed 's/$/\"/g' | 
tr '\n' ' ' > tmpFileList.txt

montage @tmpFileList.txt -set label '%t' out