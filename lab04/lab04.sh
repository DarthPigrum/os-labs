#!/bin/bash
grep -E -v '\<[a-Z]{5}\>' city.txt | wc -l > newfile.txt
grep '^Ba' city.txt | sort >> newfile.txt
cat newfile.txt
ls > result.txt
cat /etc/shells | grep -v '^#' | while read shellname
do
	grep $shellname /etc/passwd
done
