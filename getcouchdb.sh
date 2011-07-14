#!/bin/bash
# This script installs CouchDB 1.1.0 on Ubuntu 10.04 LTS and Debian based distros
echo 'Installing CouchDB dependencies'
apt-get install xulrunner-1.9.2-dev libicu-dev libcurl4-gnutls-dev libtool erlang-eunit
wget http://apache.tradebit.com/pub//couchdb/1.1.0/apache-couchdb-1.1.0.tar.gz
tar -xzvf apache-couchdb-1.1.0.tar.gz
cd apache-couchdb-1.1.0
./configure --with-js-include=/usr/lib/xulrunner-devel-1.9.2.18/include --with-js-lib=/usr/lib/xulrunner-devel-1.9.2.18/lib
make
sudo make install
echo 'couchdb: /usr/local/bin/couchdb /usr/local/etc/couchdb /usr/local/lib/couchdb'
