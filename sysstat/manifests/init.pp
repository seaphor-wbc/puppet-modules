#
# class:  sysstat - ensure sysstat is installed and running
#
#

class sysstat {
  include sysstat::params
  include sysstat::config
}
