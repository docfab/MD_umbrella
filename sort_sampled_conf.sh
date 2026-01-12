#!/bin/bash

#list 1 digit md_pull*.gro files
ls conf[0-9].gro >>list.txt

#list 2 digits md_pull*.gro files
ls conf[0-9][0-9].gro >>list.txt

#list 3 digits md_pull*.gro files
ls conf[0-9][0-9][0-9].gro >>list.txt

#list 4 digits md_pull*.gro files
ls conf[0-9][0-9][0-9][0-9].gro >>list.txt

m=$(sed -n '$=' list.txt)

for ((i=1 ; $i <= $m ; i++))
do 

	#read number of md_pull*.gro file at line i
	n=$(sed -n "$i{p;q;}" list.txt)

	#rename md_pull*.gro files with the line number
 	mv $n conf$i.gro

	#write pullf, pullx and dist files
	echo "pullf$i.xvg" >> pullf-files.dat
	echo "pullx$i.xvg" >> pullx-files.dat
	echo "dist$i.tpr" >> tpr-files.dat

done

rm list.txt
