vagrant-puppetmaster
====================

This is a vagrant project for provisioning a puppet-enterprise 3.7.1 puppetmaster, on a centos6_x64, for local development.

- Download puppet enterprise 3.7 from [https://puppet.com/misc/pe-files/previous-releases](puppet-enterprise releases into) `~/Downloads/` directory.
- Put your puppet recipes in `~/Development/Projects/` this project expects, `~/Development/Projects/puppet-recipes/modules` and `~/Development/Projects/puppet-recipes/manifests` to be valid links.
(you can change the location of course!)
- Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- Install [Vagrant](http://downloads.vagrantup.com/)
- Clone this project and cd into the project directory
- Type in ``vagrant up`` to your terminal window
- Profit

##Why?

I wanted a centos based full Puppet test environment that I could create and destroy easily. Vagrant gives me that.

##The headlines
<table>
<tr><th>IP Address</th><td>192.168.33.10</td></tr>
<tr><th>Dashboard URL</th><td>https://192.168.33.10</td></tr>
</table>

###Puppet

This will set up a puppetmaster for puppet development and testing.

###Puppet Enterprise Console

The Dashboard Enterprise Console can be accessed at [https://192.168.33.10](https://192.168.33.10).

*Inspired by https://github.com/grahamgilbert/vagrant-puppetmaster*