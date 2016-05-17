#!/usr/bin/env bash
#
# NOT BEING USED was driving me crazy !!
#
# This installs r10k and pulls the modules for continued installation
# We cannot handle failures gracefully here

set -e

if [ "$EUID" -ne "0" ]; then
  echo "This script must be run as root." >&2
  exit 1
fi

yum update -y >/dev/null

echo "Installing ruby 1.9.3..."
yum groupinstall -y "Development Tools" >/dev/null

yum install -y gcc-c++ patch readline readline-devel zlib zlib-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison iconv-devel

#sudo /etc/init.d/vboxadd setup

command curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
#gpg2 --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

#source ~/.profile

#Install RVM ( Ruby Version Manager )
curl -L get.rvm.io | bash -s stable

#Setup RVM Environment
source /etc/profile.d/rvm.sh

rvm install 1.9.3

# Install Another Version ( if Required )
# rvm install 1.8.6

rvm use 1.9.3 --default

ruby --version

#Update rubygems
gem update --system
gem install bundler

#Test ruby and rubygems are working
#Close shell and reopen for changes to take effect
ruby -v
gem -v

echo "Installing r10k..."
gem install r10k >/dev/null