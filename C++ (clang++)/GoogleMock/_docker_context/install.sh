#!/bin/bash

export CXX=clang++
export CC=clang

cd /usr/src

apt-get update
apt-get install -y wget cmake unzip


#WAS wget http://googlemock.googlecode.com/files/gmock-1.7.0.zip
wget http://pkgs.fedoraproject.org/repo/pkgs/gmock/gmock-1.7.0.zip/073b984d8798ea1594f5e44d85b20d66/gmock-1.7.0.zip
unzip gmock-1.7.0.zip

cd /usr/src/gmock-1.7.0
cmake DCMAKE_CXX_FLAGS='-Wno-unused-local-typedefs' .

cd /usr/src/gmock-1.7.0
make

cd /usr/src/gmock-1.7.0
mv libg* /usr/lib
cp -rf include/gmock /usr/include

cd /usr/src/gmock-1.7.0/gtest
mv libg* /usr/lib && cp -rf include/gtest /usr/include

apt-get remove -y wget cmake unzip
