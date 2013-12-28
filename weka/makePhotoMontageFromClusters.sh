nawk -F" " '{print >$1".txt"}' $1
for file in *
do
	cat "$file" | 
	sed 's/^[0-9]* >  /\"\.\.\/images\//' | 
	sed 's/$/\"/g' | 
	tr '\n' ' ' > tmpFileList.txt
	montage @tmpFileList.txt -set label '%t' $(echo "$file" | sed 's/txt/jpg/')
done
