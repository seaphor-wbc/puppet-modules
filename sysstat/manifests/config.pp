#
# class:  sysstat - ensure sysstat is installed and running
#
#

class sysstat::config {
    package { 'sysstat':
      ensure => present,
    }

    service { $sysstatservice :
      ensure => running,
      enable => true,
    }
  file { 
    "/etc/sysstat/sysstat":
      mode => 744, owner => root, group => root,
      source  => "puppet://$::server/modules/sysstat/sysstat",
  }
}

