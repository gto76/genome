genome
======

Bash scripts for basic DNA analysis.

counter.sh:
Returns number of 

# Koliko ponovitev enakih bitov imamo

drawPlotGbkNoLegend.sh:
# Plots tmp[number] data from tmp folder. Looks for animal names in tmp/names.
#USAGE: ./plotscript.sh "filenames" -> plots tmp1, tmp2 and tmp3
# WARNING: Always use double quotes around filenames, even if you use regex
	echo -n "set key off; " # NEW
		echo -n "'$fileName', " # NEW

drawPlotGbk.sh:
# Plots tmp[number] data from tmp folder. Looks for animal names in tmp/names.
#USAGE: ./plotscript.sh "filenames" -> plots tmp1, tmp2 and tmp3
		first=`echo $1 | grep -o "^[^ ]*"` #NEW
		ime=`cat ./tmp/names | grep "^$fileName" | sed 's/^[^ ]* \(.*\)$/\1/'` #NEW
		echo -n "'tmp/tmp$fileName' title \"$ime\", " #NEW

drawPlot.sh:
# Plots tmp[number] data from tmp folder. Looks for animal names in tmp/names.
#USAGE: ./plotscript.sh "1 2 3" -> plots tmp1, tmp2 and tmp3

genomes:

getAllCombos:
Binary file getAllCombos matches

getAllCombos.c:
#include <stdio.h>
#include <stdlib.h>

getAllCombos.sh:
#bin/sh
# Outputs all combinations of adjecent characters of length $1
# Reads from standard input

getAllNames.sh:

getGenFromGbk.sh:

getNameFromGbk.sh:

makefile:

OBSERVATIONS:
###########
###########
###########
###########
###########
###########
###########

README.md:
#	Način da prideš do pipe in
#   input=`cat`
#	echo "$input" | less
# Koliko ponovitev enakih bitov imamo
# Število bitov
#sum=$(cat "$1" | grep [^TG][^TG][^TG] -Eo | sort | uniq -c | tr -d "A-Z " | awk '{ sum += $1 } END { print sum }')
#echo "$sum"
# Plots tmp[number] data from tmp folder. Looks for animal names in tmp/names.
#USAGE: ./plotscript.sh "filenames" -> plots tmp1, tmp2 and tmp3
# WARNING: Always use double quotes around filenames, even if you use regex
	echo -n "set key off; " # NEW
		echo -n "'$fileName', " # NEW
# Plots tmp[number] data from tmp folder. Looks for animal names in tmp/names.
#USAGE: ./plotscript.sh "filenames" -> plots tmp1, tmp2 and tmp3
		first=`echo $1 | grep -o "^[^ ]*"` #NEW
		ime=`cat ./tmp/names | grep "^$fileName" | sed 's/^[^ ]* \(.*\)$/\1/'` #NEW
		echo -n "'tmp/tmp$fileName' title \"$ime\", " #NEW
# Plots tmp[number] data from tmp folder. Looks for animal names in tmp/names.
#USAGE: ./plotscript.sh "1 2 3" -> plots tmp1, tmp2 and tmp3
#include <stdio.h>
#include <stdlib.h>
#bin/sh
# Outputs all combinations of adjecent characters of length $1
# Reads from standard input
###########
###########
###########
###########
###########
###########
###########

seq1.sh:
#Vse kombinacije stirih znakov

seq2.sh:
#Stirje razlicni znaki

seq3.sh:
#stirje znaki brez ponovitve

seqencer1.sh:
#run the query over n files
#print all results side by side

seqencer2.sh:
#run the query over n files
#print all results side by side

seqencer3.sh:
#run the query over n files
#if combination doesent exist, mark it 0
#tle bi blo treba vsaki kombinaciji še odštet 1
#./trimResults.sh
#print all results side by side

seqencer4.sh:
#run the query over n files
#if combination doesnt exist, mark it 0
#order by global frequency of combination
#tle bi blo treba vsaki kombinaciji še odštet 1
#print all results side by side

seqencer5.sh:
#USAGE: ./sequencer5.sh "1 2 3"
#run the query on files, numbered in first argument
#if combination doesn't exist, mark it 0
#order by global frequency of combination
#tle bi blo treba vsaki kombinaciji še odštet 1
#print all results side by side

seqencer6.sh:
#USAGE: ./sequencer5.sh "1 2 3" <no of chars in combinations> <optional sed query>
#run the query on files, numbered in first argument
#if combination doesn't exist, mark it 0
#order by global frequency of combination
#tle bi blo treba vsaki kombinaciji še odštet 1
#print all results side by side

seqencerGbk2P1.sh:
# USAGE: ./<script name>.sh "filenames" <no of chars in combinations> <results folder>
# WARNING: Always use double quotes around filenames, so they get
# treated as single argument.
# Only performs first part of operation an saves intermediate results
# in ./comb<number of chars in comb> subfolder.
# Run the query on files, numbered in first argument.
# If combination doesn't exist, mark it 0.
# Create dirs if they don't exist
	#remove path from fName
	#progress bar
# Remove duplicates from names file

seqencerGbk2P2.sh:
# USAGE: ./<scriptname>.sh "filenames" <>
# ./sequencerGbk.sh "filenames" <no of chars in combinations> <optional sed query>
# run the query on files, numbered in first argument
# if combination doesn't exist, mark it 0
# order by global frequency of combination
#grepamo fajl z vsemi kombinacijami	po vrsti
#če slučajno ne obstaja damo v fajl: 0 <kombinacija>
	#progress bar
#print all results side by side

seqencerGbk2.sh:
#USAGE: ./sequencerGbk.sh "filenames" <no of chars in combinations> <optional sed query>
#run the query on files, numbered in first argument
#if combination doesn't exist, mark it 0
#order by global frequency of combination
	#progress bar
########
#TODO
#tle bi blo treba vsaki kombinaciji še odštet 1
#print all results side by side

seqencerGbk.sh:
#USAGE: ./sequencerGbk.sh "filenames" <no of chars in combinations> <optional sed query>
#run the query on files, numbered in first argument
#if combination doesn't exist, mark it 0
#order by global frequency of combination
#tle bi blo treba vsaki kombinaciji še odštet 1
#print all results side by side

test:

tmp:

trimResults.sh:
#make results the same length

weka:
