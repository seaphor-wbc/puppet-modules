class ntp-serv {
  include ntp-serv::params 
    package { 'ntp':
    ensure => present,
    }
#
    file { '/etc/ntp.conf':
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      source  => "puppet://$::server/modules/ntp-serv/etc/ntp.conf",
      require => Package['ntp'],
      notify  => Service[$ntpservice],
    }
    file { '/etc/sysconfig/ntp':
      owner => 'root',
      group => 'root',
      mode => '0644',
      source => "puppet://$::server/modules/ntp-serv/etc/ntp",
      require => Package['ntp'],
      notify  => Service['ntp'],
    }
    file { '/etc/syslog-ng/syslog-ng.conf':
      owner => 'root',
      group => 'root',
      mode => '0644',
      source => "puppet://$::server/modules/ntp-serv/etc/syslog-ng.conf",
    }
    file { '/etc/logrotate.d/ntpd':
      owner => 'root',
      group => 'root',
      mode => '0644',
      source => "puppet://$::server/modules/ntp-serv/etc/logrotate-ntpd",
    }
    file { '/var/log/ntpd.log':
      owner => 'ntp',
      group => 'ntp',
      mode => '0644',
    }
#    service { 'ntpd.service':
    service { $ntpservice:
      enable => true,
      ensure => 'running',
    }
  }
}

