class ntp-serv::params {
  case $::operatingsystemmajrelease {
    '11': {
      $ntpservice = 'ntp'
    }
    '12': {
      $ntpservice = 'ntpd'
    }
    '7': {
      $ntpservice = 'ntpd'
    }
    default: {
      $ntpservice = 'ntp'
    }
  }
}
