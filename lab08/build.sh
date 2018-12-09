#!/bin/bash
name='ubuntu'
maintainer='@DarthPigrum'
version='0.1'
description='3Xubuntu'
mkdir -p $name/DEBIAN
cat <<EOF >> $name/DEBIAN/control
Package: $name
Architecture: all
Maintainer: $maintainer
Version: $version
Description: $description
EOF
mkdir -p $name/usr/bin
cp script $name/usr/bin/$name
chmod 755 $name/usr/bin/$name
dpkg-deb --build $name
