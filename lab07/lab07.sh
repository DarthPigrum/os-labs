#!/bin/bash
useradd francesco
useradd alessandro
useradd lorenzo
usermod -c Marino francesco
usermod -c Lombardi alessandro
usermod -c Barbieri lorenzo
usermod -d /home/Barbieri lorenzo
usermod -s /bin/sh alessandro
groupadd italy
usermod -aG italy francesco
usermod -aG italy alessandro
usermod -aG italy lorenzo
mkdir /home/italy
chown francesco /home/italy
chgrp italy /home/italy
