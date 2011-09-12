#!/bin/sh
# This script will download and install the latest node.js + npm
# Install node.js
git clone https://github.com/joyent/node.git
cd node
mkdir ~/local
./configure --prefix=$HOME/local/node
make
make install
export PATH=$HOME/local/node/bin:$PATH
rm -rvf node/
# Install NPM
curl http://npmjs.org/install.sh | sh
