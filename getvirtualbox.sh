#!/bin/sh
# VirtualBox installer/upgrader for Mac OS X
# Updated 2011-05-27 v4.0.8
# TODO: Use http://dlc.sun.com.edgesuite.net/virtualbox/LATEST.TXT to download latest version
VERSION="4.0.8"
LOCAL_VERSION=$(VBoxManage -v)
DMG="VirtualBox-4.0.8-71778-OSX.dmg"
URL="http://dlc.sun.com.edgesuite.net/virtualbox/"$VERSION"/"$DMG

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
