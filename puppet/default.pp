#Quick Manifest to stand up a demo Puppet Master

  service{'iptables':
    ensure => stopped
  }

  host { 'test-puppetmaster.localnet':
    ensure       => 'present',
    host_aliases => ['puppet','test-puppet','test-puppetmaster','test-puppetmaster.localnet'],
    ip           => '192.168.33.10',
    target       => '/etc/hosts',
  }

  package {'pe-puppet':
    ensure  =>  present,
    require => Host['test-puppetmaster.localnet'],
  }
  service{ 'pe-puppet':
    ensure => running
  }
 
  ##we copy rather than symlinking as puppet will manage this
  file {'/etc/puppetlabs/puppet/puppet.conf':
    ensure => present,
    owner => root,
    group => root,
    source => "/vagrant/puppet/puppet.conf",
    notify  =>  [Service['pe-puppet']],
    require => Package['pe-puppet'],
  }
    
  file {'/etc/puppetlabs/puppet/autosign.conf':
    ensure => link,
    owner => root,
    group => root,
    source => "/vagrant/puppet/autosign.conf",
    notify  =>  [Service['pe-puppet']],
    require => Package['pe-puppet'],
  }
  
  file {'/etc/puppetlabs/puppet/auth.conf':
    ensure => link,
    owner => root,
    group => root,
    source => "/vagrant/puppet/auth.conf",
    notify  =>  [Service['pe-puppet']],
    require => Package['pe-puppet'],
  }
  
  file {'/etc/puppetlabs/puppet/fileserver.conf':
    ensure => link,
    owner => root,
    group => root,
    source => "/vagrant/puppet/fileserver.conf",
    notify  =>  [Service['pe-puppet']],
    require => Package['pe-puppet'],
  }
  
  file {'/etc/puppetlabs/puppet/modules':
    mode  => '0644',
    recurse => true,
  }
  
  file { '/etc/puppetlabs/puppet/hiera.yaml':
    ensure => link,
    owner => root,
    group => root,
    source => "/vagrant/puppet/hiera.yaml",
    notify  =>  [Service['pe-puppet']],
  }
  
  file { '/etc/puppetlabs/puppet/hieradata':
    mode => '0644',
    recurse => true,
  }

