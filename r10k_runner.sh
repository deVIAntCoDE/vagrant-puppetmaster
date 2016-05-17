#!/usr/bin/env bash

#NOT BEING USED!

echo "Running r10k to fetch modules for puppet provisioner..."
cp /vagrant/VagrantConf/Puppetfile .
r10k puppetfile install

rpm -qi rubygem-json

yum install -y ruby-json