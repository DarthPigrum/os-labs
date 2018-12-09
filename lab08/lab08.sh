#!/bin/bash
dpkg -l
apt update
apt install mc
dpkg -s mc | grep Version
ldd /usr/bin/mc
