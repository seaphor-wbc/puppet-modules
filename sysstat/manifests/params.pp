class sysstat::params {
  case $::operatingsystemmajrelease {
    '11': {
      $sysstatservice = 'boot.sysstat'
    }
    '12': {
      $sysstatservice = 'sysstat'
    }
    '7': {
      $sysstatservice = 'sysstat'
    }
    default: {
      $sysstatservice = 'boot.sysstat'
    }
  }
}
