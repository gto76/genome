# For every input line it downloads first google image match and saves it in pwd
cat | while read line
do 
	wget -qO- "http://images.google.com/images?q=$(echo "$line" | sed 's/ /+/g')" -U "Firefox on Ubuntu Gutsy: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1.14) Gecko/20080418 Ubuntu/7.10 (gutsy) Firefox/2.0.0.14" | 
	grep -o '<img[^>]*>' | 
	head -n1 | 
	grep "src=\"[^\"]*" -o | 
	sed 's/src=\"//' | 
	wget -i- -O "$line"
	sleep 3
done

# Script to continue from "bighead beaked sandfish":
# echo -e $(found=F; c ../names/englishNames | sed 's/^[^ ]* //' | while read line; do if [ "$line" == "bighead beaked sandfish" ]; then found=T; fi; if [ "$found" == "T" ]; then echo -n "$line\n"; fi; done;) | less | ../getGoogleImages.sh
