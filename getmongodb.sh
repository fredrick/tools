#!/bin/bash
# This script installs MongoDB 1.8.2 on Ubuntu 10.04 LTS and Debian based distros
echo 'Installing MongoDB dependencies'
apt-get install tcsh git-core scons g++ \
  libpcre++-dev libboost-dev libreadline-dev xulrunner-1.9.2-dev \
  libboost-program-options-dev libboost-thread-dev libboost-filesystem-dev libboost-date-time-dev
git clone git://github.com/mongodb/mongo.git
cd mongo
git checkout 1.8.2
scons all
sudo scons --prefix=/opt/mongo install
echo 'Creating directories'
sudo mkdir /opt/mongo/data
sudo mkdir /opt/mongo/data/db
sudo mkdir /opt/mongo/log
echo 'mongodb: /opt/mongo/bin/mongod'
# sudo /opt/mongo/bin/mongod --dbpath /opt/mongo/data/db --rest --journal
