#!/bin/sh
while read x;
do
	# desc=`apt-cache show "$x"| grep Description-en | sed 's/.*: //g'`
  desc=`dpkg-query -W -f='${Description}\n' $x | head -n 1`
	echo "$x \t- $desc"
done < packages.txt
