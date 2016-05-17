#!/usr/bin/env bash
#
# This bootstraps Puppet on Centos6 x64.
#
set -e

#REPO_RPM_URL="http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm"
pe_version='puppet-enterprise-3.7.1-el-6-x86_64'
pe_answerfile='/home/vagrant/pe-answers.txt'
puppet_home='/etc/puppetlabs/puppet/environments/production'

#--------------------------------------------------------------------
# NO TUNABLES BELOW THIS POINT
#--------------------------------------------------------------------
if [ "$EUID" -ne "0" ]; then
  echo "This script must be run as root." >&2
  exit 1
fi

# Install the PuppetLabs repo
echo "Configuring PuppetLabs repo..."

tar -xf ${pe_version}.tar.gz

#yes | ${pe_version}/puppet-enterprise-installer

bash ${pe_version}/puppet-enterprise-installer -a ${pe_answerfile}

#Extra modules i use
puppet module install -i /etc/puppetlabs/puppet/modules puppetlabs-concat

puppet module install -i /etc/puppetlabs/puppet/modules maestrodev-wget

puppet module install -i /etc/puppetlabs/puppet/modules rmueller-cron

echo "Removing default modules so we use 'puppet-recipes/'{modules|manifests}..."

mv ${puppet_home}/modules modules.old
mv ${puppet_home}/manifests manifests.old

cd ${puppet_home}

ln -s /home/vagrant/puppet/modules
ln -s /home/vagrant/puppet/manifests

#chown -R root:pe-puppet manifests
#chown -R root:pe-puppet modules
chown -h root:pe-puppet manifests
chown -h root:pe-puppet modules

echo "PuppetMaster Ready for use!!"

chkconfig iptables off

service iptables stop