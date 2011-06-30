#!/bin/sh
# VirtualBox installer/upgrader for Mac OS X
# Author: Fredrick Galoso <https://stackd.com>
# Updated 2011-06-30 | Automatically download latest DMG
# Usage: $ ./getvirtualbox.sh
VERSION=$(curl http://dlc.sun.com.edgesuite.net/virtualbox/LATEST.TXT -s)
LOCAL_VERSION=$(VBoxManage -v)
DMG=$(curl http://dlc.sun.com.edgesuite.net/virtualbox/$VERSION/ -s | grep .dmg | awk '{ print $8 }' | sed 's/\(.*\)..../\1/')
URL="http://dlc.sun.com.edgesuite.net/virtualbox/"$VERSION"/"$DMG
echo $URL
echo "Downloading VirtualBox" $VERSION
cd /tmp
curl -O $URL
echo "Mounting" $DMG
hdid $DMG
cd /Volumes/VirtualBox
echo "Running installer"
sudo installer -pkg /Volumes/VirtualBox/VirtualBox.mpkg \
      -target /Volumes/Macintosh\ HD
echo "Cleaning up, removing" \
      $(rm -v /tmp/$DMG)
echo "Unmounting" $DMG
diskutil umount force /Volumes/VirtualBox/ > /dev/null
