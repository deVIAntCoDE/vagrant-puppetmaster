# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define :master do |master_config|
    # Supports local cache, don't wast bandwitdh
    # vagrant plugin install vagrant-cachier
    # https://github.com/fgrehm/vagrant-cachier
    # if Vagrant.has_plugin?("vagrant-cachier")
    #   config.cache.auto_detect = true
    # end
    # All Vagrant configuration is done here. The most common configuration
    # options are documented and commented below. For a complete reference,
    # please see the online documentation at vagrantup.com.
    master_config.vm.hostname = "test-puppetmaster.localnet"
    # Every Vagrant virtual environment requires a box to build off of.
    master_config.vm.box = "puppetlabs/centos-6.6-64-nocm"

    # The url from where the 'master_config.vm.box' box will be fetched if it
    # doesn't already exist on the user's system.
    master_config.vm.box_url = "puppetlabs/centos-6.6-64-nocm"

    # If you're using VMWare Fusion rather than Virtualbox, you'll want to use this box_url instead
    # master_config.vm.box_url = "http://files.vagrantup.com/precise64_vmware_fusion.box"

    # Assign this VM to a host-only network IP, allowing you to access it
    # via the IP. Host-only networks can talk to the host machine as well as
    # any other machines on the same network, but cannot be accessed (through this
    # network interface) by any external networks.
    master_config.vm.network :private_network, ip: "192.168.33.10"

    master_config.vm.provider "virtualbox" do |vb|
    #   # Display the VirtualBox GUI when booting the machine
    #   vb.gui = true
    #
    #   # Customize the amount of memory on the VM:
      vb.memory = "2048"
      vb.cpus = 2
      # vb.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
    end

    # Share an additional folder to the guest VM. The first argument is
    # an identifier, the second is the path on the guest to mount the
    # folder, and the third is the path on the host to the actual folder.

    # Synchronise your puppet recipes in the vm, it assumes your module and manifest dirs are under '~/Development/Projects/puppet-recipes/'
    master_config.vm.synced_folder "~/Development/Projects/puppet-recipes/modules", "/home/vagrant/puppet/modules"
    master_config.vm.synced_folder "~/Development/Projects/puppet-recipes/manifests", "/home/vagrant/puppet/manifests"

    master_config.vm.provision "file", source: "~/Downloads/puppet-enterprise-3.7.1-el-6-x86_64.tar.gz", destination: "puppet-enterprise-3.7.1-el-6-x86_64.tar.gz"
    master_config.vm.provision "file", source: "all-in-one.answers.txt", destination: "pe-answers.txt"
    master_config.vm.provision :shell, :path => "puppet_master.sh"


    # master_config.vm.provision :shell, :path => "init_puppet.sh"

  end

  
end
