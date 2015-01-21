#!/usr/bin/env bash

#
# Setup dependencies
#
apt-get update
apt-get -y install memcached

#
# Use our own memcached configuration that
# listens on all ports and uses verbose
# output.
#
rm -f /etc/memcached.conf
cp ./memcached.conf /etc/

service memcached restart