#!/bin/bash

N_conf=
group1=
group2=

rm summary_distances.dat

for (( i=0 ; i<=$N_conf ; i++ ))
do

	echo -e "Processing configuration $i..."
	gmx distance -s md_pull.tpr -f conf${i}.gro -n index.ndx -oall dist${i}.xvg -select "com of group ${group1} plus com of group ${group2}" &>/dev/null

done

echo -e "Writing summary file..."

for (( i=0 ; i<=$N_conf ; i++ ))
do

	distance=$(cat dist$i.xvg | tail -1 | awk '{print $2}')
	echo -e "$i\t$distance" >> summary_distances.dat

done

echo -e "Cleaning up..."

for (( i=0 ; i<=$N_conf ; i++ ))
do

	rm dist$i.xvg

done
