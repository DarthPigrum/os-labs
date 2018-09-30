#!/bin/bash
mkdir ~/ggg;
cd ~/ggg;
echo "Hello world" > "abc d";
echo "Hello world" > "ab c d";
echo "Hello world" > "abcd";
echo "Hello world" > "a b c d";
find * ! -name '* *' | while read filename
do
	echo "$filename"
	cat "$filename"
done
