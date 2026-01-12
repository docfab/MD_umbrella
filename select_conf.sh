#!/bin/bash

[[ -f conf.list ]] || { echo "conf.list missing"; exit 1; }

mkdir conf

while read i

	cp conf$i.gro conf

done <conf.list

exit
