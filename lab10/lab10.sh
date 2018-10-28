#!/bin/bash
dd if=/dev/zero of=/dev/file1 bs=1000M count=1
dd if=/dev/zero of=/dev/file2 bs=1000M count=1
losetup /dev/loop1 /dev/file1
losetup /dev/loop2 /dev/file2
vgcreate myGroup /dev/loop1 /dev/loop2
lvcreate -L 550M -n data1 myGroup
lvcreate -L 550M -n data2 myGroup
lvcreate -L 550M -n data3 myGroup
mkfs.ext4 /dev/myGroup/data1
mkfs.ext4 /dev/myGroup/data2
mkfs.ext4 /dev/myGroup/data3