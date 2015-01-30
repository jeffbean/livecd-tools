#!/bin/bash

cd /tmp/

wget http://people.redhat.com/~rjones/virt-what/files/virt-what-1.14.tar.gz
tar xvf virt-what-1.14.tar.gz
rm -f virt-what-1.14.tar.gz
cd virt-what-1.14
./configure
make
make dist-all

