#!/bin/bash
mkdir /home/userN
for i in {1..100}
do
	useradd -d /home/userN user$i
done
